defmodule Jobbex.Jobs.JobSupervisor do
  use Supervisor, restart: :temporary

  def start_link(args) do
    Supervisor.start_link(__MODULE__, args)
  end

  def init(args) do
    children = [
      {Jobbex.Jobs.Job, args}
    ]

    options = [
      strategy: :one_for_one,
      max_seconds: 30_000
    ]

    Supervisor.init(children, options)
  end
end
