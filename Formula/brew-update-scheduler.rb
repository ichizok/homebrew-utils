class BrewUpdateScheduler < Formula
  desc "Brew-update scheduler"
  url "https://github.com/ichizok/homebrew-utils/raw/main/README.md"
  sha256 "b3dec272d7e547b1bb3529d6299caae8661ebadfb08101946291a1fbbe391ecf"
  version "1.0.0"

  keg_only "provides only service"

  depends_on "terminal-notifier"

  def install
    system "touch", prefix/"placeholder"
  end

  def caveats
    <<~EOS
      This formula provides only service, so you should run after installation:
        brew services start #{name}

      Default schedule is "0 0 * * *" by cron-format. If you want to change it:
        export UPDATE_SCHEDULE="[cron-format]" brew install #{name}
    EOS
  end

  service do
    run [HOMEBREW_BREW_FILE, "update-log"]
    run_at_load false
    run_type :cron
    cron (ENV["UPDATE_SCHEDULE"] || "0 0 * * *")
    log_path HOMEBREW_LOGS/"update.log"
    error_log_path HOMEBREW_LOGS/"update.log"
  end

  test do; end
end
