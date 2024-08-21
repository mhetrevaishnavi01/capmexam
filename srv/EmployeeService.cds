using { ust.mhetre.vaishnavi.DB.Employee } from '../db/employeedatamodel';

service EmployeeService @(path:'EmployeeService') {

    entity  EmployeeSet  as projection on Employee;

}


