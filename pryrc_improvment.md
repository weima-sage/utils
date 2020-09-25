# Improving debugging experience with pry configuration

Background: `pry-byebug` provides a powerful tool for us to perform debugging tasks. Sometimes, typing the full command feels tiring. The following tricks can help reduce amount of typing and making debugging more pleasant.

1. First create a .pryrc file at your home directory

```ruby
if defined?(PryByebug)
  # Save your favorite shortcuts
  aliases = {
    'wh' => 'whereami',
    'bt' => 'backtrace',
    'ex' => 'exit',
    'ed' => 'edit',
    'c' => 'continue',
    's' => 'step',
    'n' => 'next',
    'f' => 'finish'
  }
  aliases.each { |_alias, command| Pry.commands.alias_command _alias, command }

  # making Enter repeat last command, so we save a combination of `up-arrow` + `Enter` into a single `Enter` key press
  Pry.commands.command /^$/, "repeat last command" do
    pry_instance.run_command Pry.history.to_a.last
  end
end
```

2. Mount the .pryrc file into the image we are going to debug.
   In `docker-compose-start.local.yml` file, mount the configuration file to image

```yml
services:
  app-accounting:
    ...
    volumes: ...
      - ~/.pryrc:/root/.pryrc
```

3. Start application with ```script/docker/start.sh --clean```, you should be able to use the shortcuts in the configuration file.



