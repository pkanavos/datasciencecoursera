

test.that_TX_Heart_Attach_Is_Cypress <- function() {
  
  result<-best("TX","heart attack")

  checkEquals(result,"CYPRESS FAIRBANKS MEDICAL CENTER")  
}

test.that_BB_Fails <- function() {

  best("BB","heart attack")
  error<-geterrmessage()
  checkEquals(error,"invalid outcome")
}

test.that_Hert_Attack_Fails <- function() {
  
  best("NY","hert attack")
  error<-geterrmessage()
  checkEquals(error,"invalid outcome")
}

test.that_MD_Heart_Attack_Is_John_Hopkins <- function() {
  
  result<-best("MD", "heart attack")
  checkEquals(result,"JOHNS HOPKINS HOSPITAL, THE")  
  
}

test.that_MT_Heart_Attack_Is_Benefis_Hospitalis <- function() {
  
  result<-best("MT", "heart attack")
  checkEquals(result,"BENEFIS HOSPITALS INC")  
  
}


test.that_MD_Pneumonia_Is_Baltimore <- function() {
  
  result<-best("MD", "pneumonia")

  checkEquals(result,"GREATER BALTIMORE MEDICAL CENTER")  
  
}


