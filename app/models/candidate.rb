class Candidate < ActiveRecord::Base
	attr_accessor :password_confirmation
	belongs_to :address
	has_many :conversations, :foreign_key => :sender_id
	
	has_attached_file :upload
	do_not_validate_attachment_file_type :upload

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d+\-.]+\.[a-z]+\Z/i
	validates :name, presence: true
	validates :email, presence: true, :uniqueness => true, :format => EMAIL_REGEX
	#has_secure_password
	validates :password,:confirmation =>true, presence: true

	validates :date_of_birth, presence: true
	validates :sex, presence: true
	
	#validates_attachment :upload,
    #:content_type => { :content_type => ["audio/mpeg", "audio/mp3"] },
    #:file_name => { :matches => [/mp3\Z/] }, presence: true
    #validates_attachment :upload,
    #:content_type => {:content_type => ["image/jpg","image/jpeg","image/gif"]},
    #:file_name => {:matches => [/image\Z/]},
    #presence: true
    #validates_attachment_content_type :upload, content_type: /\Aimage\/.*\Z/ 

	before_create do
		today = Time.now.strftime("%Y/%m/%d")
		present_date = Date.parse(today)
		b= self.date_of_birth.strftime("%Y/%m/%d")
		birth_date = Date.parse(b)
		total_days = (present_date - birth_date).to_i
		present_age = total_days/365
		self.age = present_age
		self.password= Digest::MD5.hexdigest(password)
	end

	def self.authenticate(candidate_email="",candidate_password="")
		candidate = Candidate.find_by_email(candidate_email)
		if candidate && candidate.match_password(candidate_password)
			return candidate
		else
			false
		end
	end
	def match_password(candi_password="")
 	 	self.password == Digest::MD5.hexdigest(candi_password)
	end
	def self.search(search)
	  where("name ILIKE ?", "%#{search}%") 
	  #where("id ILIKE ?", "%#{search}%")
	end

end
