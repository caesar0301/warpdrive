# Syntax for linux FOR loops
# ref: https://www.cyberciti.biz/faq/bash-for-loop/

# Numeric ranges
for i in 1 2 3 4 5
do
   echo "Welcome $i times"
done

# OR

for i in {1..5}
do
   echo "Welcome $i times"
done

# OR

for i in {0..10..2}
  do 
     echo "Welcome $i times"
 done

# C style
#!/bin/bash
for (( c=1; c<=5; c++ ))
do  
   echo "Welcome $c times"
done

# OR
for (( ; ; ))
do
   echo "infinite loops [ hit CTRL+C to stop]"
done

# FOR BREAK
for I in 1 2 3 4 5
do
  statements1      #Executed for all values of ''I'', up to a disaster-condition if any.
  statements2
  if (disaster-condition)
  then
	break       	   #Abandon the loop.
  fi
  statements3          #While good and, no disaster-condition.
done

# FOR CONTINUE
for I in 1 2 3 4 5
do
  statements1      #Executed for all values of ''I'', up to a disaster-condition if any.
  statements2
  if (condition)
  then
	continue   #Go to next iteration of I in the loop and skip statements3
  fi
  statements3
done
