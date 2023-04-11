
namespace :jobs do
  desc "runs the SOM algorithm for all maps"
  task execute_som: :environment do
    Map.all.each { |map| RunSelfOrganizingMapJob.perform_later(map) }
  end
end
