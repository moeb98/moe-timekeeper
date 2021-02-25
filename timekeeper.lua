-- determine current time
time = os.date("*t")

-- save timestamp for analysis 
file = io.open("timedata.lua", "a")
io.output(file)
io.write("Entry{year="..time.year..
  ",month="..time.month..",day="..time.day..
  ",hour="..time.hour..",min="..time.min.."}\n")
io.flush()
io.close(file)

-- record time 
startofwork = nil
workingtimes = {}

-- read and analyse timestamp from file 'timedate.lua'
function Entry(e)
  if (startofwork == nil) then
    startofwork = e
  else
    workingtime_today = os.difftime(os.time(e), os.time(startofwork))
    startofwork = nil

    -- calculate monthly working hours 
    if (workingtimes[e.year] == nil) then
      -- create entry for respective year, in case there no entry yet 
      workingtimes[e.year]={}
    end
    if (workingtimes[e.year][e.month] == nil) then
      workingtimes[e.year][e.month]=workingtime_today
    else
      workingtimes[e.year][e.month]=workingtimes[e.year][e.month]+
        workingtime_today
    end
  end
end

-- load and analyze data 
dofile("timedata.lua")

-- show results 
print("Working hours per year: ")
for y,m in pairs(workingtimes) do
  print("During year "..y..":")
  workingtimes_year=0
  for i,j in pairs(m) do
    print(" in month "..i.." you have worked in total "..((j/60)/60)..
" hours.")
    workingtimes_year=workingtimes_year+j
  end
  print ("That sums up to "..((workingtimes_year/60)/60).." hours.")
end
