-module(config_SUITE).

%% CT
-export([
  all/0,
  init_per_suite/1,
  end_per_suite/1
]).

%% Test Cases
-export([check_overrun_handler/1]).

-type config() :: [{atom(), term()}].

%%%=============================================================================
%%% Common test
%%%=============================================================================

-spec all() -> [atom()].
all() -> [check_overrun_handler].

-spec init_per_suite(config()) -> config().
init_per_suite(Config) ->
  {ok, _} = application:ensure_all_started(sumo_db_mysql),
  Config.

-spec end_per_suite(config()) -> config().
end_per_suite(Config) ->
  Config.

%%%=============================================================================
%%% Exported Tests Functions
%%%=============================================================================

check_overrun_handler(_Config) ->
  sumo:call(sumo_test_people_mysql, takes_too_long, []).
