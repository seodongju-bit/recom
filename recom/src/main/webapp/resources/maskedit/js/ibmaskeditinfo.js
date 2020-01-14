
   /**
    * ibmaskeditinfo.js
    */



//기본옵션 설정 예제
//IBMaskEdit.extendDefaults({
//        //guideChar: "",
//        hideGuideCharOnBlur : true
//    }
//
//);

////사용자 지정 설정 예제
//IBMaskEdit.extendAliases({
//    'comMask': {
//        alias: "999-999",
//        guideChar:"_",
//        placeHolder: 'input'
//    }
//});



//IBMaskEdit 7.0버전 호환성
   (function(global) {
       // Define Old Version Compatible Property
       var sPrefix = 'dt',
           tmpObj = {
               None    : 0,
               Date    : 1,
               Time    : 2,
               User    : 3,
               Number  : 4,
               Password: 5
           }, sName;

       for(sName in tmpObj) {
           global[sPrefix + sName] = tmpObj[sName];
       }

       /**
        * IBMaskEdit Initialize Method (Old Version Compatible)
        * Old   : createIBMaskEdit(id[, width, height, nType])
        * Latest: createIBMaskEdit(id, options)
        */
       global['createIBMaskEdit'] = function() {
           CreateIBMaskEditV3(arguments);
       };
   })(window);

