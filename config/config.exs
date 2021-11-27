# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :friends, Friends.Repo,
  database: "friends_repo",
  username: "kommit",
  password: "kommit",
  hostname: "localhost",
  port: "5432"

config :friends, ecto_repos: [Friends.Repo]

config :iex, default_prompt: ">>>"

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#
