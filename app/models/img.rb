class Img < ActiveRecord::Base
  validates_format_of :content_type,
                      :with => /^image/,
                      :message => "-- we can only upload pictures"

  def uploaded_picture=(img_field)
    self.name = base_part_of(img_field.original_filename)
    self.content_type = img_field.content_type.chomp
    self.data = img_field.read
  end

  def base_part_of(file_name)
    File.basename(file_name).gsub(/[^\w._-]/, '')
  end
end
