component{
	targetCFC = "";
	function getSynchronizedObject(any obj){
		targetCFC = obj;
		return this;
	}
	
	function onMissingMethod(string missingMethodName, struct missingMethodArguments){
		var returnVar = "";
		cflock(name=application.applicationName, type="Exclusive", timeout="60"){
			cfinvoke(component=targetCFC, method=arguments.missingMethodName, argumentcollection=missingMethodArguments, returnvariable=returnVar   );
		};
		return returnVar;
	}
}