class User < ApplicationRecord

  MOTHER = [
    ["Therese Zahlten Adamski", "Therese Zahlten Adamski"],
    ["Frances Wilson Adamski", "Frances Wilson Adamski"],
    ["Bobbie Bonano Adamski", "Bobbie Bonano Adamski"],
    ["Felicia Pandolfi Adamski", "Felicia Pandolfi Adamski"],
    ["Stephanie Adamski Koppmann", "Stephanie Adamski Koppmann"],
    ["Wanda Smus Adamski", "Wanda Smus Adamski"],
    ["Charlene Adamski", "Charlene Adamski"],
    ["Julie Adamski", "Julie Adamski"],
    ["Susan Adamski Grupp", "Susan Adamski Grupp"],
    ["Delphine Adamski Skiba ", "Delphine Adamski Skiba "],
    ["Lucja Skiba", "Lucja Skiba"],
    ["Rachel Skiba Williams", "Rachel Skiba Williams"],
    ["Mariah Skiba Myrick", "Mariah Skiba Myrick"],
    ["Laura Skiba Muryani", "Laura Skiba Muryani"],
    ["Sara Skiba", "Sara Skiba"],
    ["Catherine Skiba", "Catherine Skiba"],
    ["Helene Adamski Szewczyk","Helene Adamski Szewczyk"],
    ["Karen Bartold Szewczyk","Karen Bartold Szewczyk"],
    ["Karen Kuczarski McGettrick","Karen Kuczarski McGettrick"],
    ["Mary Kuczarski","Mary Kuczarski"],
    ["Lisa Kuczarski ","Lisa Kuczarski "],
    ["Antoinette Adamski Pieniazek","Antoinette Adamski Pieniazek"],
    ["Shauna Pieniazek","Shauna Pieniazek"],
    ["Ann Pieniazek","Ann Pieniazek"],
    ["Joanne Pieniazek Slosek","Joanne Pieniazek Slosek"],
  ].freeze

  FATHER = [
    ["Eligio Adamski","Eligio Adamski"],
    ["Lawrence Adamski","Lawrence Adamski"],
    ["Mark Adamski","Mark Adamski"],
    ["Franklin Adamski","Franklin Adamski"],
    ["Craig Koppmann","Craig Koppmann"],
    ["Norbert Adamski","Norbert Adamski"],
    ["Edwin Adamski","Edwin Adamski"],
    ["Steve Adamski","Steve Adamski"],
    ["Jim Grupp","Jim Grupp"],
    ["Paul Adamski","Paul Adamski"],
    ["Edward Adamski","Edward Adamski"],
    ["Mike Williams","Mike Williams"],
    ["Justin Myrick","Justin Myrick"],
    ["Fred Muryani","Fred Muryani"],
    ["Rob Skiba","Rob Skiba"],
    ["Michael Downey","Michael Downey"],
    ["Edward Szewczyk","Edward Szewczyk"],
    ["Michael Szewczyk","Michael Szewczyk"],
    ["Thomas Szewczyk","Thomas Szewczyk"],
    ["William Szewczyk","William Szewczyk"],
    ["Frank Kuczarski","Frank Kuczarski"],
    ["Paul McGettrick","Paul McGettrick"],
    ["Franklin Kuczarski","Franklin Kuczarski"],
    ["Robert Nicholl","Robert Nicholl"],
    ["Donald Kuczarski","Donald Kuczarski"],
    ["Thadius Pieniazek","Thadius Pieniazek"],
    ["Matthew Pieniazek","Matthew Pieniazek"],
    ["Michael Pieniazek","Michael Pieniazek"],
    ["John Slosek Jr.","John Slosek Jr."],
    ["David Pieniazek","David Pieniazek"]
  ].freeze

  STATE = [
      ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY']
  ].freeze

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :omniauth_providers => [:facebook]

  # CarrierWave Mounted Uploader for Avatar as well as
  # AcrtiveRecord relation to photos
  has_many :photos
  # mount_uploader :image, ImageUploader

  # Authentication for OAuth - Facebook
  def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
     user.name = auth.info.name
     user.image = auth.info.image
    end
  end
end
