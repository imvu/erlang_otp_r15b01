%%------------------------------------------------------------
%%
%% Implementation stub file
%% 
%% Target: CosNotification_EventType
%% Source: /usr/local/src/erlang-otp-r15b01-0.1+imvu/lib/cosNotification/src/CosNotification.idl
%% IC vsn: 4.2.30
%% 
%% This file is automatically generated. DO NOT EDIT IT.
%%
%%------------------------------------------------------------

-module('CosNotification_EventType').
-ic_compiled("4_2_30").


-include("CosNotification.hrl").

-export([tc/0,id/0,name/0]).



%% returns type code
tc() -> {tk_struct,"IDL:omg.org/CosNotification/EventType:1.0","EventType",
                   [{"domain_name",{tk_string,0}},
                    {"type_name",{tk_string,0}}]}.

%% returns id
id() -> "IDL:omg.org/CosNotification/EventType:1.0".

%% returns name
name() -> "CosNotification_EventType".



