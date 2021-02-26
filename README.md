# timekeeper

This is a small tool written in Lua to keep track of your
working hours. When calling the script with

´´´bash
lua timekeeper.lua
´´´

it records corresponding start and end times. At the same
time, it calculates and provides the statistics on the
command line.

## Installation

This is simple: just install lua with e.g.

´´´bash
apt install lua
´´´

... and store the script wherever you want on your filesystem.

## Usage

This is also simple: just run the script via

´´´bash
lua timekeeper.lua
´´´

in the respective directory and a ´´´timedata´´´ file is created
effectively serving as the database and the first work start is
recorded. With following calls, the next work end, work start,
work end... and so on is recorded. At the same time the work
statistics is printed on the command line. That´s it!

## Security Remarks

The ´´´timedata´´´ file contains the working time as code,
to be specific as a function call that is executed directly
by the ´´´timekeeper.lua´´´ script. This is dangerous, as
anybody who has access to the ´´´timedata´´´ file can inject
potentially malicious code. Thus, make sure that only you
have access by setting the access right to

´´´bash
chmod 600 timedata.lua
´´´

once it has been created.
