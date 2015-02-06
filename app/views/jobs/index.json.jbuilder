json.array!(@jobs) do |job|
  json.extract! job, :name
  json.url job_url(job, format: :json)
end
