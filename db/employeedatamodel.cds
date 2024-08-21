namespace ust.mhetre.vaishnavi.DB;
using { cuid, Currency } from '@sap/cds/common';
using { ust.mhetre.vaishnavi.common } from './common';



       entity Employee: cuid{        
        nameFirst: String(40);
        nameMiddle: String(40);
        nameLast: String(40);
        nameInitials: String(40);
        sex: common.Gender;
        Language: String(1);
        phoneNumber: common.phoneNumber;
        Email:common.Email;
        loginName:String(12);
        Currency:Currency;
        salaryAmount:Decimal(10,2);
        accountNumber:String(16);
        bankId:String(8);
        bankName:String(64);
        
    
 
}