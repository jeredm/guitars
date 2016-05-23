ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Guitars.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Guitars.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Guitars.Repo)

