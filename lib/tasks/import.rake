require 'highline/import'

namespace :import do
  desc "Import files"
  task :files => :environment do
    FileStore.class_eval { def file_changed?; false; end } # stub to avoid sha1_hash recalc
    source = ENV['SOURCE'] or raise 'Specify SOURCE env param'
    say "START import from #{source}..."
    Dir.glob(File.join source, '**', '*.*').each do |file|
      print "Processing #{file}... "
      sha1_hash = file.split('/')[-2]
      file_store = FileStore.create do |fs|
        fs.file = File.open(file)
        fs.sha1_hash = sha1_hash
      end
      print file_store.persisted? ? "Imported ##{file_store.id} with #{file_store.sha1_hash}" : "Error: #{file_store.errors.full_messages.join('. ')}"
      FileUtils.rm file
      puts
    end
    say 'DONE'
  end
end
