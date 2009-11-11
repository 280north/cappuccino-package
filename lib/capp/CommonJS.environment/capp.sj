@STATIC;1.0;p;15;Configuration.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jI;21;Foundation/CPObject.jc;4158;
var _1=require("file"),_2=require("system"),_3=require("objective-j/plist");
var _4=nil,_5=nil,_6=nil;
var _7=objj_allocateClassPair(CPObject,"Configuration"),_8=_7.isa;
class_addIvars(_7,[new objj_ivar("path"),new objj_ivar("dictionary"),new objj_ivar("temporaryDictionary")]);
objj_registerClassPair(_7);
objj_addClassForBundle(_7,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_7,[new objj_method(sel_getUid("initWithPath:"),function(_9,_a,_b){
with(_9){
_9=objj_msgSendSuper({receiver:_9,super_class:objj_getClass("CPObject")},"init");
if(_9){
path=_b;
temporaryDictionary=objj_msgSend(CPDictionary,"dictionary");
if(path&&_1.isReadable(path)){
dictionary=_3.readPlist(path);
}
if(!dictionary){
dictionary=objj_msgSend(CPDictionary,"dictionary");
}
}
return _9;
}
}),new objj_method(sel_getUid("path"),function(_c,_d){
with(_c){
return path;
}
}),new objj_method(sel_getUid("storedKeyEnumerator"),function(_e,_f){
with(_e){
return objj_msgSend(dictionary,"keyEnumerator");
}
}),new objj_method(sel_getUid("keyEnumerator"),function(_10,_11){
with(_10){
var set=objj_msgSend(CPSet,"setWithArray:",objj_msgSend(dictionary,"allKeys"));
objj_msgSend(set,"addObjectsFromArray:",objj_msgSend(temporaryDictionary,"allKeys"));
objj_msgSend(set,"addObjectsFromArray:",objj_msgSend(_4,"allKeys"));
return objj_msgSend(set,"objectEnumerator");
}
}),new objj_method(sel_getUid("valueForKey:"),function(_12,_13,_14){
with(_12){
var _15=objj_msgSend(dictionary,"objectForKey:",_14);
if(!_15){
_15=objj_msgSend(temporaryDictionary,"objectForKey:",_14);
}
if(!_15){
_15=objj_msgSend(_4,"objectForKey:",_14);
}
return _15;
}
}),new objj_method(sel_getUid("setValue:forKey:"),function(_16,_17,_18,_19){
with(_16){
objj_msgSend(dictionary,"setObject:forKey:",_18,_19);
}
}),new objj_method(sel_getUid("setTemporaryValue:forKey:"),function(_1a,_1b,_1c,_1d){
with(_1a){
objj_msgSend(temporaryDictionary,"setObject:forKey:",_1c,_1d);
}
}),new objj_method(sel_getUid("save"),function(_1e,_1f){
with(_1e){
if(!objj_msgSend(_1e,"path")){
return;
}
_3.writePlist(objj_msgSend(_1e,"path"),dictionary);
}
})]);
class_addMethods(_8,[new objj_method(sel_getUid("initialize"),function(_20,_21){
with(_20){
if(_20!==objj_msgSend(Configuration,"class")){
return;
}
_4=objj_msgSend(CPDictionary,"dictionary");
objj_msgSend(_4,"setObject:forKey:","You","user.name");
objj_msgSend(_4,"setObject:forKey:","you@yourcompany.com","user.email");
objj_msgSend(_4,"setObject:forKey:","Your Company","organization.name");
objj_msgSend(_4,"setObject:forKey:","feedback @nospam@ yourcompany.com","organization.email");
objj_msgSend(_4,"setObject:forKey:","http://yourcompany.com","organization.url");
objj_msgSend(_4,"setObject:forKey:","com.yourcompany","organization.identifier");
var _22=new Date(),_23=["Janurary","February","March","April","May","June","July","August","September","October","November","December"];
objj_msgSend(_4,"setObject:forKey:",_22.getFullYear(),"project.year");
objj_msgSend(_4,"setObject:forKey:",_23[_22.getMonth()]+" "+_22.getDate()+", "+_22.getFullYear(),"project.date");
}
}),new objj_method(sel_getUid("defaultConfiguration"),function(_24,_25){
with(_24){
if(!_5){
_5=objj_msgSend(objj_msgSend(_24,"alloc"),"initWithPath:",nil);
}
return _5;
}
}),new objj_method(sel_getUid("userConfiguration"),function(_26,_27){
with(_26){
if(!_6){
_6=objj_msgSend(objj_msgSend(_26,"alloc"),"initWithPath:",_1.join(_2.env["HOME"],".cappconfig"));
}
return _6;
}
})]);
config=function(){
var _28=0,_29=arguments.length,key=NULL,_2a=NULL,_2b=NO,_2c=NO;
for(;_28<_29;++_28){
var _2d=arguments[_28];
switch(_2d){
case "--get":
_2b=YES;
break;
case "-l":
case "--list":
_2c=YES;
break;
default:
if(key===NULL){
key=_2d;
}else{
_2a=_2d;
}
}
}
var _2e=objj_msgSend(Configuration,"userConfiguration");
if(_2c){
var key=nil,_2f=objj_msgSend(_2e,"storedKeyEnumerator");
while(key=objj_msgSend(_2f,"nextObject")){
print(key+"="+objj_msgSend(_2e,"valueForKey:",key));
}
}else{
if(_2b){
var _2a=objj_msgSend(_2e,"valueForKey:",key);
if(_2a){
print(_2a);
}
}else{
if(key!==NULL&&_2a!==NULL){
objj_msgSend(_2e,"setValue:forKey:",_2a,key);
objj_msgSend(_2e,"save");
}
}
}
};
p;10;Generate.ji;15;Configuration.jc;4216;
var OS=require("OS"),_1=require("system"),_2=require("file"),_3=require("objective-j");
gen=function(){
var _4=0,_5=arguments.length,_6=false,_7=false,_8=false,_9=false,_a="Application",_b="";
for(;_4<_5;++_4){
var _c=arguments[_4];
switch(_c){
case "-l":
_6=true;
break;
case "-t":
case "--template":
_a=arguments[++_4];
break;
case "-f":
case "--frameworks":
_7=true;
break;
case "--noconfig":
_8=true;
break;
case "--force":
_9=true;
break;
default:
_b=_c;
}
}
if(_b.length===0){
_b=_7?".":"Untitled";
}
var _d=null;
if(_2.isAbsolute(_a)){
_d=_2.join(_a);
}else{
_d=_2.join(_1.env["SELF_HOME"],"lib","capp","Resources","Templates",_a);
}
var _e=_2.join(_d,"template.config"),_f={};
if(_2.isFile(_e)){
_f=JSON.parse(_2.read(_e,{charset:"UTF-8"}));
}
var _10=_b,_11=_8?objj_msgSend(Configuration,"defaultConfiguration"):objj_msgSend(Configuration,"userConfiguration");
if(_7){
createFrameworksInFile(_10,_6,_9);
}else{
if(!_2.exists(_10)){
OS.system("cp -vR "+_d+" "+_10);
var _12=_2.glob(_2.join(_10,"**","*")),_4=0,_5=_12.length,_13=_2.basename(_10),_14=objj_msgSend(_11,"valueForKey:","organization.identifier")||"";
objj_msgSend(_11,"setTemporaryValue:forKey:",_13,"project.name");
objj_msgSend(_11,"setTemporaryValue:forKey:",_14+"."+toIdentifier(_13),"project.identifier");
objj_msgSend(_11,"setTemporaryValue:forKey:",toIdentifier(_13),"project.nameasidentifier");
for(;_4<_5;++_4){
var _15=_12[_4];
if(_2.isDirectory(_15)){
continue;
}
if([".png",".jpg",".jpeg",".gif",".tif",".tiff"].indexOf(_2.extension(_15))!==-1){
continue;
}
var _16=_2.read(_15,{charset:"UTF-8"}),key=nil,_17=objj_msgSend(_11,"keyEnumerator");
while(key=objj_msgSend(_17,"nextObject")){
_16=_16.replace(new RegExp("__"+RegExp.escape(key)+"__","g"),objj_msgSend(_11,"valueForKey:",key));
}
_2.write(_15,_16,{charset:"UTF-8"});
}
var _18=_10;
if(_f.FrameworksPath){
_18=_2.join(_18,_f.FrameworksPath);
}
createFrameworksInFile(_18,_6);
}else{
print("Directory already exists");
}
}
};
createFrameworksInFile=function(_19,_1a,_1b){
var _1c=_2.path(_19);
var _1d=["Foundation","AppKit"];
if(!_1c.isDirectory()){
throw new Error("Can't create Frameworks. Directory does not exist: "+_1c);
}
var _1e=_1c.join("Frameworks"),_1f=_1c.join("Frameworks","Debug");
print("Creating Frameworks directory in "+_1e+".");
_1f.mkdirs();
if(_1a){
if(!(_1.env["CAPP_BUILD"]||_1.env["STEAM_BUILD"])){
throw "CAPP_BUILD or STEAM_BUILD must be defined";
}
var _20=_2.path(_1.env["CAPP_BUILD"]||_1.env["STEAM_BUILD"]);
var _21=_20.join("Release"),_22=_20.join("Debug");
_1d.concat("Objective-J").forEach(function(_23){
installFramework(_21.join(_23),_1e.join(_23),_1b,true);
installFramework(_22.join(_23),_1f.join(_23),_1b,true);
});
}else{
var _24=_2.path(_3.OBJJ_HOME);
var _25=_24.join("Frameworks","Objective-J");
var _26=_24.join("Frameworks","Debug","Objective-J");
installFramework(_25,_1e.join("Objective-J"),_1b,false);
installFramework(_26,_1f.join("Objective-J"),_1b,false);
_1d.forEach(function(_27){
var _28;
for(var i=0,_28=false;!_28&&i<_3.objj_frameworks.length;i++){
var _29=_2.path(_3.objj_frameworks[i]).join(_27);
if(_2.isDirectory(_29)){
installFramework(_29,_1e.join(_27),_1b,false);
_28=true;
}
}
if(!_28){
print("Warning: Couldn't find framework \""+_27+"\"");
}
for(var i=0,_28=false;!_28&&i<_3.objj_debug_frameworks.length;i++){
var _2a=_2.path(_3.objj_debug_frameworks[i]).join(_27);
if(_2.isDirectory(_2a)){
installFramework(_2a,_1f.join(_27),_1b,false);
_28=true;
}
}
if(!_28){
print("Warning: Couldn't find debug framework \""+_27+"\"");
}
});
}
};
installFramework=function(_2b,_2c,_2d,_2e){
if(_2c.exists()){
if(_2d){
_2c.rmtree();
}else{
print("Warning: "+_2c+" already exists. Use --force to overwrite.");
return;
}
}
if(_2b.exists()){
print((_2e?"Symlinking ":"Copying ")+_2b+" to "+_2c);
if(_2e){
_2.symlink(_2b,_2c);
}else{
_2.copyTree(_2b,_2c);
}
}else{
print("Warning: "+_2b+" doesn't exist.");
}
};
toIdentifier=function(_2f){
var _30="",_31=0,_32=_2f.length,_33=NO,_34=new RegExp("^[a-zA-Z_$]"),_35=new RegExp("^[a-zA-Z_$0-9]");
for(;_31<_32;++_31){
var _36=_2f.charAt(_31);
if((_31===0)&&_34.test(_36)||_35.test(_36)){
if(_33){
_30+=_36.toUpperCase();
}else{
_30+=_36;
}
_33=NO;
}else{
_33=YES;
}
}
return _30;
};
p;6;main.jI;23;Foundation/Foundation.ji;15;Configuration.ji;10;Generate.jc;1915;
main=function(){
if(system.args.length<1){
return printUsage();
}
var _1=0,_2=system.args.length;
for(;_1<_2;++_1){
var _3=system.args[_1];
switch(_3){
case "version":
case "--version":
return print("capp version 0.7.1");
case "-h":
case "--help":
return printUsage();
case "config":
return config.apply(this,system.args.slice(_1+1));
case "gen":
return gen.apply(this,system.args.slice(_1+1));
default:
print("unknown command "+_3);
}
}
};
printUsage=function(){
print("capp [--version] COMMAND [ARGS]");
print("    --version         Print version");
print("    -h, --help        Print usage");
print("");
print(ANSITextApplyProperties("    gen",ANSI_BOLD)+" PATH          Generate new project at PATH from a predefined template");
print("    -l                Symlink the Frameworks folder to your $CAPP_BUILD or $STEAM_BUILD directory");
print("    -t, --template    Specify the template name to use (listed in capp/Resources/Templates)");
print("    -f, --frameworks  Create only frameworks, not a full application");
print("    --force           Overwrite Frameworks directory if it already exists");
print("");
print(ANSITextApplyProperties("    config ",ANSI_BOLD));
print("    name value        Set a value for a given key");
print("    -l, --list        List all variables set in config file.");
print("    --get name        Get the value for a given key");
};
getFiles=function(_4,_5,_6){
var _7=[],_8=_4.listFiles(),_9=typeof _5!=="string";
if(_8){
var _a=0,_b=_8.length;
for(;_a<_b;++_a){
var _c=_8[_a],_d=FILE.basename(_c),_e=!_5;
if(_6&&fileArrayContainsFile(_6,_c)){
continue;
}
if(!_e){
if(_9){
var _f=_5.length;
while(_f--&&!_e){
var _10=_5[_f];
if(_d.substring(_d.length-_10.length-1)===("."+_10)){
_e=true;
}
}
}else{
if(_d.substring(_d.length-_5.length-1)===("."+_5)){
_e=true;
}
}
}
if(FILE.isDirectory(_c)){
_7=_7.concat(getFiles(_c,_5,_6));
}else{
if(_e){
_7.push(_c);
}
}
}
}
return _7;
};
e;