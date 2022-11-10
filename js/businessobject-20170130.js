function businessObjectToJSon(initialObject) {
	returndata = null;

	$.ajax({
		url: "ui/businessobjecttojson.php",
		dataType: initialObject.datatype == null ? 'json' : initialObject.datatype,
		async: initialObject.async == null ? false : initialObject.async,
		data: {
			args: initialObject.args == null ? {} : initialObject.args,
			classname: initialObject.classname,
			methodname: initialObject.methodname,
			datatype: initialObject.datatype == null ? 'json' : initialObject.datatype,
		},
		type: "POST",
		error: function(jqXHR, textStatus, errorThrown) {
			if (initialObject.error) {
				initialObject.error(jqXHR, textStatus, errorThrown);
			
			} else {
//				pwAlert("Error thrown in [" + initialObject.classname + "." + initialObject.methodname + "]:" + errorThrown);
				pwAlert(errorThrown);
			}
		},
		success: function(data) {
			returndata = data;
			
			if (initialObject.success) {
				initialObject.success(data);
			}
		}
	});
	
	return returndata;
}