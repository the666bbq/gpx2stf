//import {xsltProcess, xmlParse} from "xslt-processor"

//const xp = require('xsltProcess');
//const pars = require('xmlParse');
const testFolder = '.';
const fs = require('fs');
const _ = require('lodash');
const { xmlParse, xsltProcess } = require('xslt-processor');




fs.readdir(testFolder, (err, files) => {
    files.forEach(file => {

        let n = file.search(/\.gpx$/i);//stf
        if(n<0) return file;

        console.log(n+":"+file);

        fs.readFile(file, "utf8", (err, data) => {
            //if (err) throw err;
            //console.log(data);
            data = prefix_namesspace(data);
            return transform_xml(data,file);

        });

    });
})

function prefix_namesspace(data){
    return data.replace('xmlns=','xmlns:d=');
}


function transform_xml(data,file){
    const xml = xmlParse(data); // xmlString: string of xml file contents

    var xslt = fs.readFileSync('gpx2stf.xsl', 'utf8');
    const xsl = xmlParse(xslt); // xsltString: string of xslt file contents

    var outXmlString = xsltProcess(xml, xsl); // outXmlString: output xml string.


    /* cdata bug ?? */
    var testen = '<name>test</name>';
    outXmlString = outXmlString.replace(/<name>/g,'<name><![CDATA[');
    outXmlString = outXmlString.replace(/<\/name>/g,']]></name>');
    outXmlString = outXmlString.replace(/<description>/g,'<description><![CDATA[');
    outXmlString = outXmlString.replace(/<\/description>/g,']]></description>');

    //console.log("output :"+outXmlString);


    let new_file = file.replace("gpx","stf");

    fs.writeFile(new_file, outXmlString, (err) => {
        if (err) throw err;
        console.log('The file '+new_file+' has been saved!');
    });
}
