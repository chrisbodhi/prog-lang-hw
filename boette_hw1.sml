(* Exercise #1 *)
(* Write a function is_older that takes two dates and evaluates to true or false. It evaluates to true if the first argument is a date that comes before the second argument. (If the two dates are the same, the result is false.) *)
(* notes: why was this so hard? cleaner way to do this? *)
fun is_older( date1 : int*int*int, date2 : int*int*int ) =
  if (#1 date1) < (#1 date2) 
  then true
  else if (#2 date1) < (#2 date2)
  then true
  else if (#3 date1) < (#3 date2) 
  then true
  else false

(* Exercise #2 *)
(* Write a function number_in_month that takes a list of dates and a month (i.e., an int) and returns how many dates in the list are in the given month. *)
fun in_month( date: int*int*int, month: int ) =
    if (#2 date)=month
    then 1
    else 0

fun number_in_month( dates : (int*int*int) list , month : int ) =
  if null dates
  then 0
  else
    in_month(hd dates, month) + number_in_month( tl dates, month)

(* Exercise #3 *)
(* Write a function number_in_months that takes a list of dates and a list of months (i.e., an int list) and returns the number of dates in the list of dates that are in any of the months in the list of months. Assume the list of months has no number repeated. Hint: Use your answer to the previous problem *)
fun number_in_months( dates : (int*int*int) list , months : int list ) =
  if null months
  then []
  else
    number_in_month(dates, hd months)::number_in_months(dates, tl months)

(* Exercise #4 *)
(* Write a function dates_in_month that takes a list of dates and a month (i.e., an int) and returns a list holding the dates from the argument list of dates that are in the month. The returned list should contain dates in the order they were originally given. *)
fun dates_in_month( dates : (int*int*int) list , month : int ) =
  if null dates
  then []
  else
    if (#2 (hd dates))=month 
    then (hd dates) :: dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month)

(* Exercise 5 *)
(* Write a function dates_in_months that takes a list of dates and a list of months (i.e., an int list) and returns a list holding the dates from the argument list of dates that are in any of the months in the list of months. Assume the list of months has no number repeated. Hint: Use your answer to the previous problem and SML’s list-append operator (@). *)
fun dates_in_months( dates : (int*int*int) list , months : int list ) =
  if null months
  then []
  else dates_in_month( dates, hd months) @ dates_in_months( dates, tl months)
