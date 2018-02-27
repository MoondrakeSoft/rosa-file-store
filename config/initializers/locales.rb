# crude & ugly, but whatever.. :p

locales_en = Rails.root.join('config', 'locales', 'en.yml').to_s

File.open(locales_en, "w+") do |f|
	f.write(ERB.new(File.read(locales_en + ".erb")).result())
end

