# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
import Config

config :birthday_reminder, BirthdayReminder.Repo,
  url: System.get_env("DATABASE_URL")

config :birthday_reminder, BirthdayReminderWeb.Endpoint,
  http: [:inet6, port: 4000],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  url: [scheme: "https", host: System.get_env("APP_NAME") <> ".gigalixirapp.com", port: 443],
  check_origin: ["https://" <> System.get_env("APP_NAME") <> ".gigalixirapp.com", "//localhost"],
  server: true,
  live_view: [signing_salt: System.get_env("LIVEVIEW_SALT")]

config :nadia,
  token: System.get_env("TELEGRAM_BOT_ID")
