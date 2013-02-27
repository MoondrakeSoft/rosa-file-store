class FileStore < ActiveRecord::Base
  attr_accessible #:file
  validates :file, :sha1_hash, :presence => true
  validate lambda {
    errors.add(:sha1_hash, "^'#{sha1_hash}' - such file already has been uploaded") if FileStore.exists?(:sha1_hash => sha1_hash)
  }

  mount_uploader :file, FileUploader

  scope :by_hash, lambda {|h| where :sha1_hash => h}

  def file_name
    file.url.split('/').last
  end

   # Exclude file info from json output, add file_name to it
   def as_json(options={})
     options[:except] ||= [:file]
     options[:methods] ||= [:file_name]
     super(options)
   end
end
