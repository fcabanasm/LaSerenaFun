class Attachment < ActiveRecord::Base
  belongs_to :apartment
  after_save :save_image

PATH_FILES = File.join Rails.root, "public","files"
  def file=(file)
  	unless file.blank?
  		@file = file
  		self.name = file.original_filename
  		self.extension = file.original_filename.split(".").last.downcase
  	end
  end

  def path_image
  	File.join PATH_FILES, "#{self.id}.#{self.extension}"
  end

  def have_file?
  	File.exists? path_file
  end

  private
  def save_image
  	if @file
  		FileUtils.mkdir_p PATH_FILES
  		File.open(path_image,"wb") do |f|
  			f.write(@file.read)
  		end
  		@file = nil
  	end
  end
  	
end
