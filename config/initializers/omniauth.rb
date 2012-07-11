Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'YtxzwXypu3t8H1D2mk5UjA', 'CQlCxJ4LFOaxmTQEjaiJeWnYwpo1y2PC42CXrLzxoqc'
  provider :facebook, '202284159899227', '42890ff08d4f956227bb1b78f65739f1'
  provider :google_oauth2, '239519401304.apps.googleusercontent.com', 'y0G-xH2rKEoP0uNynFOmH4Rk'
end