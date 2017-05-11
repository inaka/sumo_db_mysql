%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% @author Juan Facorro <juan.facorro@inakanetworks.com>
%%% @doc Sumo DB Store
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-module(sumo_test_store).

%%% Default store functions.
 -include_lib("mixer/include/mixer.hrl").
 -mixin([
   {sumo_store_mysql, [
     init/1,
     create_schema/2,
     delete_all/2,
     delete_by/3,
     execute/2,
     execute/3,
     find_all/2,
     find_all/5,
     find_by/3,
     find_by/5,
     find_by/6,
     persist/2,
     fetch/3,
     count/2
   ]}
 ]).

%%% Custom store functions.
-export([
  takes_too_long/2
]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% sumo_store custom functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-spec takes_too_long(DocName :: atom(), State :: sumo_store_mysql:state()) ->
  {ok, {docs, []}, sumo_store_mysql:state()}.
takes_too_long(_DocName, State) ->
  timer:sleep(1000),
  {ok, {docs, []}, State}.
