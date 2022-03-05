#!/usr/bin/env bash

## List of available animations
# ASCII
classic=( \- \\ \| \/ )
box=( ┤ ┴ ├ ┬ )
bubble=( · o O o )
breathe=( '  ()  ' ' (  ) ' '(    )' ' (  ) ' )
growing_dots=( '.  ' '.. ' '...' '.. ' )
passing_dots=( '.  ' '.. ' ' ..' '  .' '   ' )
metro=( '[    ]' '[=   ]' '[==  ]' '[=== ]' '[ ===]' '[  ==]' '[   =]' )
# UTF-8
classic_utf8=( \— \\ \| \/ )
bounce=( . · ˙ · )
vertical_block=( ▁ ▂ ▃ ▄ ▅ ▆ ▇ █ ▇ ▆ ▅ ▄ ▃ ▂ )
horizontal_block=( ▉ ▊ ▋ ▌ ▍ ▎ ▏ ▎ ▍ ▌ ▋ ▊ )
quarter=( ▖ ▘ ▝ ▗ )
triangle=( ◢ ◣ ◤ ◥)
semi_circle=( ◐ ◓ ◑ ◒ )
rotating_eyes=( ◡◡ ⊙⊙ ◠◠ )
braille=( ⠁ ⠂ ⠄ ⡀ ⢀ ⠠ ⠐ ⠈ )
braille_whitespace=( ⣾ ⣽ ⣻ ⢿ ⡿ ⣟ ⣯ ⣷ )
trigram=( ☰ ☱ ☳ ☶ ☴ )
clock=( 🕛 🕐 🕑 🕒 🕓 🕔 🕕 🕖 🕗 🕘 🕙 🕚 )
arrow=( ▹▹▹▹▹ ▸▹▹▹▹ ▹▸▹▹▹ ▹▹▸▹▹ ▹▹▹▸▹ ▹▹▹▹▸ )
bouncing_ball=( '( ●    )' '(  ●   )' '(   ●  )' '(    ● )' '(     ●)' '(    ● )' '(   ●  )' '(  ●   )' '( ●    )' '(●     )' )
earth=( 🌍 🌎 🌏 )
pong=( ▐⠂       ▌ ▐⠈       ▌ ▐ ⠂      ▌ ▐ ⠠      ▌ ▐  ⡀     ▌ ▐  ⠠     ▌ ▐   ⠂    ▌ ▐   ⠈    ▌ ▐    ⠂   ▌ ▐    ⠠   ▌ ▐     ⡀  ▌ ▐     ⠠  ▌ ▐      ⠂ ▌ ▐      ⠈ ▌ ▐       ⠂▌ ▐       ⠠▌ ▐       ⡀▌ ▐      ⠠ ▌ ▐      ⠂ ▌ ▐     ⠈  ▌ ▐     ⠂  ▌ ▐    ⠠   ▌ ▐    ⡀   ▌ ▐   ⠠    ▌ ▐   ⠂    ▌ ▐  ⠈     ▌ ▐  ⠂     ▌ ▐ ⠠      ▌ ▐ ⡀      ▌ ▐⠠       ▌ )
big_dot=( ∙∙∙ ●∙∙ ∙●∙ ∙∙● )
football=(  🧑⚽️       🧑 🧑  ⚽️      🧑 🧑   ⚽️     🧑 🧑    ⚽️    🧑 🧑     ⚽️   🧑 🧑      ⚽️  🧑 🧑       ⚽️🧑  🧑      ⚽️  🧑 🧑     ⚽️   🧑 🧑    ⚽️    🧑 🧑   ⚽️     🧑 🧑  ⚽️      🧑 )
orange_pulse=( 🔸 🔶 🟠 🟠 🔶 )
blue_pulse=( 🔹 🔷 🔵 🔵 🔷 )
modern_metro=( ▰▱▱▱▱▱▱ ▰▰▱▱▱▱▱ ▰▰▰▱▱▱▱ ▱▰▰▰▱▱▱ ▱▱▰▰▰▱▱ ▱▱▱▰▰▰▱ ▱▱▱▱▰▰▰ ▱▱▱▱▱▰▰ ▱▱▱▱▱▱▰ ▱▱▱▱▱▱▱ )

# Chose which animation will we displayed, and its speed
active_animation=${classic[@]}
animation_speed=0.25

# Stop the animation and restore the normal cursor if the script is interrupted
trap stop_progress_bar SIGINT

animation() {
  while true ; do
    tput civis
    for frame in ${active_animation[@]} ; do
      printf "\r${frame}"
      sleep ${animation_speed}
    done
  done
}

start_progress_bar() {
  animation &
  animation_id=$!
}

stop_progress_bar() {
  kill ${animation_id} &> /dev/null
  printf "\n"
  tput cnorm
}

# Demo the animation
start_progress_bar
sleep 10
stop_progress_bar
