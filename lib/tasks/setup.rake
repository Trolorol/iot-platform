namespace :setup do
    task run: :environment do
      Rake::Task["db:create"].execute
      Rake::Task["db:migrate"].execute
      Rake::Task["db:seed"].execute if Store.count.zero?
      # Rake::Task["partition:fields"].execute
      # ((-2)..0).each do |year_offset|
      #   year = Date.today.year
      #   partition_year = year + year_offset
      #   Rake::Task["partition:months"].reenable
      #   Rake::Task["partition:months"].invoke(partition_year)
      # end
    end
  
    task reset: :environment do
      Rake::Task["db:drop"].execute
      Rake::Task["setup:run"].execute
    end
  end