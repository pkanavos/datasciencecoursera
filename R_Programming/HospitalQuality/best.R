best <- function(state, outcome) {
  hospitalData<-read.csv("data/outcome-of-care-measures.csv")
  
  stateRows=nrow(hospitalData %>% filter (State==state))
  if (stateRows ==0 )
    stop("invalid state")
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  groups <- hospitalData %>%
    group_by(State) 
  if (outcome == "heart attack")
    entries<-groups %>% filter(State==state & 
             as.numeric(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)==min(as.numeric(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),na.rm=TRUE)) 
  else if (outcome== "heart failure")
    entries<-groups %>% filter(State==state & 
                      as.numeric(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)==min(as.numeric(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),na.rm=TRUE)) 
    else if (outcome== "pneumonia")
      entries<-groups %>% filter(State==state & 
                        as.numeric(Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)==min(as.numeric(Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),na.rm=TRUE)) 
  else
    stop("invalid outcome")
  arrange(entries,Hospital.Name) %>%
    select(Hospital.Name)
  #sapply(entries$Hospital.Name,as.character)
  as.character(entries[[1,2]])
}
