%%------------------------------------------------------------
%%
%% Implementation stub file
%% 
%% Target: CosEventChannelAdmin_ProxyPushConsumer
%% Source: /usr/local/src/erlang-otp-r15b01-0.1+imvu/lib/cosEvent/src/CosEventChannelAdmin.idl
%% IC vsn: 4.2.30
%% 
%% This file is automatically generated. DO NOT EDIT IT.
%%
%%------------------------------------------------------------

-module('CosEventChannelAdmin_ProxyPushConsumer').
-ic_compiled("4_2_30").


%% Interface functions
-export([connect_push_supplier/2, connect_push_supplier/3]).

%% Exports from "CosEventComm::PushConsumer"
-export([push/2, push/3, disconnect_push_consumer/1]).
-export([disconnect_push_consumer/2]).

%% Type identification function
-export([typeID/0]).

%% Used to start server
-export([oe_create/0, oe_create_link/0, oe_create/1]).
-export([oe_create_link/1, oe_create/2, oe_create_link/2]).

%% TypeCode Functions and inheritance
-export([oe_tc/1, oe_is_a/1, oe_get_interface/0]).

%% gen server export stuff
-behaviour(gen_server).
-export([init/1, terminate/2, handle_call/3]).
-export([handle_cast/2, handle_info/2, code_change/3]).

-include_lib("orber/include/corba.hrl").


%%------------------------------------------------------------
%%
%% Object interface functions.
%%
%%------------------------------------------------------------



%%%% Operation: connect_push_supplier
%% 
%%   Returns: RetVal
%%   Raises:  CosEventChannelAdmin::AlreadyConnected
%%
connect_push_supplier(OE_THIS, Push_supplier) ->
    corba:call(OE_THIS, connect_push_supplier, [Push_supplier], ?MODULE).

connect_push_supplier(OE_THIS, OE_Options, Push_supplier) ->
    corba:call(OE_THIS, connect_push_supplier, [Push_supplier], ?MODULE, OE_Options).

%%%% Operation: push
%% 
%%   Returns: RetVal
%%   Raises:  CosEventComm::Disconnected
%%
push(OE_THIS, Data) ->
    corba:call(OE_THIS, push, [Data], ?MODULE).

push(OE_THIS, OE_Options, Data) ->
    corba:call(OE_THIS, push, [Data], ?MODULE, OE_Options).

%%%% Operation: disconnect_push_consumer
%% 
%%   Returns: RetVal
%%
disconnect_push_consumer(OE_THIS) ->
    corba:call(OE_THIS, disconnect_push_consumer, [], ?MODULE).

disconnect_push_consumer(OE_THIS, OE_Options) ->
    corba:call(OE_THIS, disconnect_push_consumer, [], ?MODULE, OE_Options).

%%------------------------------------------------------------
%%
%% Inherited Interfaces
%%
%%------------------------------------------------------------
oe_is_a("IDL:omg.org/CosEventChannelAdmin/ProxyPushConsumer:1.0") -> true;
oe_is_a("IDL:omg.org/CosEventComm/PushConsumer:1.0") -> true;
oe_is_a(_) -> false.

%%------------------------------------------------------------
%%
%% Interface TypeCode
%%
%%------------------------------------------------------------
oe_tc(connect_push_supplier) -> 
	{tk_void,[{tk_objref,"IDL:omg.org/CosEventComm/PushSupplier:1.0",
                             "PushSupplier"}],
                 []};
oe_tc(push) -> 'CosEventComm_PushConsumer':oe_tc(push);
oe_tc(disconnect_push_consumer) -> 'CosEventComm_PushConsumer':oe_tc(disconnect_push_consumer);
oe_tc(_) -> undefined.

oe_get_interface() -> 
	[{"disconnect_push_consumer", 'CosEventComm_PushConsumer':oe_tc(disconnect_push_consumer)},
	{"push", 'CosEventComm_PushConsumer':oe_tc(push)},
	{"connect_push_supplier", oe_tc(connect_push_supplier)}].




%%------------------------------------------------------------
%%
%% Object server implementation.
%%
%%------------------------------------------------------------


%%------------------------------------------------------------
%%
%% Function for fetching the interface type ID.
%%
%%------------------------------------------------------------

typeID() ->
    "IDL:omg.org/CosEventChannelAdmin/ProxyPushConsumer:1.0".


%%------------------------------------------------------------
%%
%% Object creation functions.
%%
%%------------------------------------------------------------

oe_create() ->
    corba:create(?MODULE, "IDL:omg.org/CosEventChannelAdmin/ProxyPushConsumer:1.0").

oe_create_link() ->
    corba:create_link(?MODULE, "IDL:omg.org/CosEventChannelAdmin/ProxyPushConsumer:1.0").

oe_create(Env) ->
    corba:create(?MODULE, "IDL:omg.org/CosEventChannelAdmin/ProxyPushConsumer:1.0", Env).

oe_create_link(Env) ->
    corba:create_link(?MODULE, "IDL:omg.org/CosEventChannelAdmin/ProxyPushConsumer:1.0", Env).

oe_create(Env, RegName) ->
    corba:create(?MODULE, "IDL:omg.org/CosEventChannelAdmin/ProxyPushConsumer:1.0", Env, RegName).

oe_create_link(Env, RegName) ->
    corba:create_link(?MODULE, "IDL:omg.org/CosEventChannelAdmin/ProxyPushConsumer:1.0", Env, RegName).

%%------------------------------------------------------------
%%
%% Init & terminate functions.
%%
%%------------------------------------------------------------

init(Env) ->
%% Call to implementation init
    corba:handle_init('CosEventChannelAdmin_ProxyPushConsumer_impl', Env).

terminate(Reason, State) ->
    corba:handle_terminate('CosEventChannelAdmin_ProxyPushConsumer_impl', Reason, State).


%%%% Operation: connect_push_supplier
%% 
%%   Returns: RetVal
%%   Raises:  CosEventChannelAdmin::AlreadyConnected
%%
handle_call({OE_THIS, OE_Context, connect_push_supplier, [Push_supplier]}, _, OE_State) ->
  corba:handle_call('CosEventChannelAdmin_ProxyPushConsumer_impl', connect_push_supplier, [Push_supplier], OE_State, OE_Context, OE_THIS, false);

%%%% Operation: push
%% 
%%   Returns: RetVal
%%   Raises:  CosEventComm::Disconnected
%%
handle_call({OE_THIS, OE_Context, push, [Data]}, _, OE_State) ->
  corba:handle_call('CosEventChannelAdmin_ProxyPushConsumer_impl', push, [Data], OE_State, OE_Context, OE_THIS, false);

%%%% Operation: disconnect_push_consumer
%% 
%%   Returns: RetVal
%%
handle_call({OE_THIS, OE_Context, disconnect_push_consumer, []}, _, OE_State) ->
  corba:handle_call('CosEventChannelAdmin_ProxyPushConsumer_impl', disconnect_push_consumer, [], OE_State, OE_Context, OE_THIS, false);



%%%% Standard gen_server call handle
%%
handle_call(stop, _, State) ->
    {stop, normal, ok, State};

handle_call(_, _, State) ->
    {reply, catch corba:raise(#'BAD_OPERATION'{minor=1163001857, completion_status='COMPLETED_NO'}), State}.


%%%% Standard gen_server cast handle
%%
handle_cast(stop, State) ->
    {stop, normal, State};

handle_cast(_, State) ->
    {noreply, State}.


%%%% Standard gen_server handles
%%
handle_info(Info, State) ->
    corba:handle_info('CosEventChannelAdmin_ProxyPushConsumer_impl', Info, State).


code_change(OldVsn, State, Extra) ->
    corba:handle_code_change('CosEventChannelAdmin_ProxyPushConsumer_impl', OldVsn, State, Extra).

