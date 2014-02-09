#-*- encoding: utf-8 -*-

desc "Einlesen von Ferien. Parameter: Dateiname, Halbjahr, Ferien oder Feiertag"
task :einlesen_vacancies => [:environment] do 
  script_path = Rails.root.to_s + "/doc/"
  path = script_path + "frei_2014-2015.txt" #args.datei
  puts path
  fail "specify filename to create" unless path
  file = File.open(path, "r")
  title = start = ende = ""
  while !file.eof?
    line = file.readline
    #line.gsub!(/\n?/, "")
    line.chop!

    period = line.gsub("#period:", '') if line.index("#period:") == 0
    type = line.gsub("#type:", '') if line.index("#type:") == 0

    if line.index("END:VEVENT") == 0          #!title.empty? && !start.empty? && !ende.empty?
      puts "typ:#{type} + |#{title}| - #{start} - #{ende}"
      Vacancy.create(title: title, first_day: start, last_day: ende, period: period)
      title = start = ende = ""
    end

    if type == "Ferien"
      title = line.gsub("DESCRIPTION:", '') if line.index("DESCRIPTION:") == 0
      start = line.gsub("DTSTART;VALUE=DATE:", "").insert(4,'-').insert(7,'-') if line.index("DTSTART;VALUE=DATE:") == 0
      ende =  line.gsub("DTEND;VALUE=DATE:", "").insert(4,'-').insert(7,'-') if line.index("DTEND;VALUE=DATE:") == 0 
    elsif type == "Feiertage"
      title = line.gsub("SUMMARY:", '') if line.index("SUMMARY:") == 0
      start = ende = line.gsub("DTSTART;VALUE=DATE:", "").insert(4,'-').insert(7,'-') if line.index("DTSTART;VALUE=DATE:") == 0
    end
    
  end

end