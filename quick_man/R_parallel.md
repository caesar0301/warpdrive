```R
library("parallel")
library("foreach")
library("doParallel")

x <- foreach(i=1:1000, .combine='rbind') %:% {
   foreach(j=1:20, .combine='c') %dopar% {
          paste(i, j)
   }
}

x <- foreach(i=1:1000, .combine='rbind') %:%
   foreach(j=1:10, .combine='c') %dopar% {
     l <- runif(1, i, 100)
     i + j + l 
   }

jobs <- dlply(en.mob.s, c("UID"), function(user)
  mcparallel(hmm.learn(user), name = unique(user$UID))
)
models <- mccollect(jobs)
```