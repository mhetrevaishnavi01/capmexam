module.exports = cds.service.impl( async function(){
 
    //Step 1: get the object of our odata entities
    const { EmployeeSet } = this.entities;
 
    this.before('CREATE', EmployeeSet, (req) => {
        var salary = parseInt(req.data.salaryAmount);
        var currency_code=req.data.Currency_code;
        if(salary<50000 && currency_code === 'USD' ){
           console.log("Create operation successful");
       }
       else{
        req.error(500,"Employee’s salary must be less than 50000 USD");
       }
       
    });

    this.before('UPDATE', EmployeeSet, (req) => {
        var nameFirst= req.data.nameFirst;
        var loginName = req.data.loginName;
        if(nameFirst && loginName){
            req.error(500,"Operation not allowed");
       }
       console.log("‘Update operation successful");
    });
 
    this.before('DELETE', EmployeeSet, (req) => {
        var nameFirst= req.data.nameFirst;
    //     if(nameFirst==='S%'){
            
    //         req.error(500,"cannot delete as name starts with S");
    //    }

    
    if(nameFirst.startsWith('S')){
        req.error(500,"cannot delete as name starts with S");
    }
       console.log("DELETE operation successful");
    });


 
 
   
}
);
