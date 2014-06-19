module ApplicationHelper
  def result_file_upload(studenttest)
    if studenttest.result_file.blank? 
      raw('<i class="fi-x dark-blue icon-normal"></i>')
    else
      link_to(raw('<i class="fi-upload dark-green icon-normal"></i>'), download_studenttest_path(studenttest), title: "Dokument herunterladen")
    end
  end
end
