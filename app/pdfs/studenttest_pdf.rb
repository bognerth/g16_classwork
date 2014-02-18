class StudenttestPdf < Prawn::Document
  def initialize(studenttest)
    super(top_margin: 70)
    @studenttest = studenttest
    @questions = @studenttest.classtest.testtype.questions

    text "Testergebnis", size: 30, style: :bold
    move_down 20
    text "Erreichte Punktzahl: #{@studenttest.points} von 100."
    move_down 15
    text "Das ergibt die Note: #{POINTS_TO_NOTE[@studenttest.points]}."
    move_down 20
    @questions.each do |question|
      line_items(question)
    end
  end

  def line_items(question)
    @question = question
    move_down 20
    table line_item_rows do
      self.width = 540
      row(0).font_style = :bold
      columns(0).align = :center
      columns(0).width = 30
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end

  def line_item_rows
    [['',@question.title]] +
    @studenttest.studentanswers.where(:question_id => @question.id).map do |answer|
      #[self.answer_grafik(answer),answer.text]
      #[{:image => self.answer_grafik(answer)}, answer.text]

      #@studenttest.studentanswers.where(:question_id => @question.id).map do |sa| 
        # [('<i class="fi-like dark-green icon-normal"></i>' if sa.answer.points > 0), 
        #   ('<i class="fi-checkbox dark-green icon-normal"></i>' if sa.selected),
          [self.answer_grafik(answer),answer.answer.title]
      #end
    end
  end

  def answer_grafik(answer)
    grafik = ""
    grafik = "RA" if answer.answer.points > 0
    grafik = grafik + " OK" if answer.selected
    #{Rails.root}/app/assets/images/#{grafik}"
    grafik
  end
end