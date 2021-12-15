# frozen_string_literal: true

namespace :provisioning do
  namespace :shared do
    namespace :dataset do
      namespace :roles do
        desc 'Populate all roles'
        task populate: :environment do
          def prefix
            "Task [provisioning:shared:dataset:roles:populate] [#{DateTime.current}]:"
          end
          
          puts "#{prefix} Initialized"

          ActiveRecord::Base.connection.execute <<-SQL
            INSERT INTO roles (id, name, status, created_at, updated_at) VALUES (1, 'vendor', 'active', '2021-06-23 16:27:30.019856', '2021-06-23 16:27:30.019856') ON CONFLICT DO NOTHING;
            INSERT INTO roles (id, name, status, created_at, updated_at) VALUES (2, 'manager', 'active', '2021-06-23 16:27:30.019857', '2021-06-23 16:27:30.019857') ON CONFLICT DO NOTHING;
          SQL
          
          puts "#{prefix} Finished"
        end
      end
    end
  end
end