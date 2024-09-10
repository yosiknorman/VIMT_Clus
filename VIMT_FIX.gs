'reinit'
'sdfopen input/data_stream-oper.nc'

*'sdfopen input/SPress.nc'


'set lon 90 120'
'set lat -10 10'
'set t 1 744'


'define qu=vint(const(lon,1000,-a),q*u,300)'
'define qv=vint(const(lon,1000,-a),q*v,300)'
*'define VIMFC= -hdivg(qu,qv)


'set sdfwrite middleman/Qi.nc'
'sdfwrite qu'

'set sdfwrite middleman/Qj.nc'
'sdfwrite qv'

'set sdfwrite middleman/VIMFC.nc'
'sdfwrite VIMFC'

