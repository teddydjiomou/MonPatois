OmniAuth.config.logger = Rails.logger
#OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '718531591588636', '5cc860ca3d2ab9af8e9a8fb340f413c8',
           :scope => 'email,public_profile', :display => 'popup'
           
  provider :google_oauth2, '703017122501-02967n9jbccatmrqoaono2fr9i7oljuu.apps.googleusercontent.com', 'U9VM9MTUWcRNdlqtQyvP7PyJ',
    {
      :name => "google",
      :scope => "email, profile",
      :prompt => "select_account",
      :image_aspect_ratio => "square",
      :image_size => 50
    }
    
  provider :twitter, '5eYt9IXy2fc87ax79lZEHcuRU', 'OYM7d4dipaClGF64clJv0Qonj13e7M4Ye0g1IIK947U3KDHHBc',
    {
      :secure_image_url => 'true',
      :image_size => 'original',
      :authorize_params => {
        :force_login => 'false'
       }
     }
end