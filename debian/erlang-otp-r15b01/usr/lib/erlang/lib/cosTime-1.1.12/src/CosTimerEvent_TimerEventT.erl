%%------------------------------------------------------------
%%
%% Implementation stub file
%% 
%% Target: CosTimerEvent_TimerEventT
%% Source: /usr/local/src/erlang-otp-r15b01-0.1+imvu/lib/cosTime/src/CosTimerEvent.idl
%% IC vsn: 4.2.30
%% 
%% This file is automatically generated. DO NOT EDIT IT.
%%
%%------------------------------------------------------------

-module('CosTimerEvent_TimerEventT').
-ic_compiled("4_2_30").


-include("CosTimerEvent.hrl").

-export([tc/0,id/0,name/0]).



%% returns type code
tc() -> {tk_struct,"IDL:omg.org/CosTimerEvent/TimerEventT:1.0","TimerEventT",
                   [{"utc",
                     {tk_struct,"IDL:omg.org/TimeBase/UtcT:1.0","UtcT",
                                [{"time",tk_ulonglong},
                                 {"inacclo",tk_ulong},
                                 {"inacchi",tk_ushort},
                                 {"tdf",tk_short}]}},
                    {"event_data",tk_any}]}.

%% returns id
id() -> "IDL:omg.org/CosTimerEvent/TimerEventT:1.0".

%% returns name
name() -> "CosTimerEvent_TimerEventT".



