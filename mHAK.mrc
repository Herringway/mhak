on *:load: {
  writeini $mhakdir $+ YI.ini settings lastdir $mhakdir
  remini $mhakdir $+ YI.ini settings lastfile
}
alias mVER {
  return 0.001 Alpha 3
}
alias mainini {
  return $mhakdir $+ mHAK.ini
}
alias curini {
  var %blah = $mhakdir $+ $readini($mainini,$romdata(%mhak.rom $+ |0x0081DB|5),Info)
  if (.ini !isin %blah) {
    var %blah = $mhakdir $+ $readini($mainini,$romdata(%mhak.rom $+ |0x0101DB|5),Info)
  }
  return %blah
}
dialog mHAK.text {
  size -1 -1 450 330
  title "mHAK.text"
  list 1,0 1 450 200,extsel size
  edit "",2,0 200 450 100, multi return vsbar
  button "Apply Changes",3,215 300 125 30
  button "Close",4,340 300 110 30, cancel 
}
dialog mHAK.level {
  title "mHAK.Level"
  size -1 -1 225 190
  option dbu
  icon $mhakdir $+ yoshi.ico, 0
  tab General, 23, 1 35 220 138
  edit "", 11, 114 128 16 10, tab 23
  edit "", 17, 176 128 16 10, tab 23, limit 4
  text "Unknown 2", 25, 132 129 44 10, tab 23
  text "Layer 1 Position", 26, 132 103 44 10, tab 23
  text "Layer 2 Position", 27, 132 90 44 10, tab 23
  text "Special Effects", 28, 132 79 44 10, tab 23
  text "Layer 3 Tileset", 24, 67 140 44 10, tab 23
  text "Unknown 1", 29, 67 128 44 10, tab 23
  text "Layer Order", 30, 67 116 44 10, tab 23
  text "Sprite Palette", 31, 67 103 44 10, tab 23
  text "Spriteset", 32, 67 91 44 10, tab 23
  text "Layer 1 Obj. Pal.", 33, 4 103 44 10, tab 23
  text "Layer 2 Image", 34, 4 115 44 10, tab 23
  text "Layer 3 Image", 35, 4 141 44 10, tab 23
  text "Layer 3 Obj. Pal.", 36, 67 79 44 10, tab 23
  text "Music:", 22, 132 116 44 10,tab 23
  edit "", 16, 176 115 16 10, tab 23
  text "BG Color:", 21, 4 79 44 10, tab 23
  edit "", 10, 114 115 16 10, tab 23
  text "Tileset", 20, 4 91 44 10, tab 23
  edit "", 9, 114 103 16 10, tab 23
  text "Layer 2 Obj. Pal", 19, 4 128 44 10, tab 23
  edit "", 8, 114 91 16 10, tab 23
  edit "", 7, 114 79 16 10, tab 23
  list 18, 59 11 40 27, vsbar
  text Level:, 39, 39 20 17 8
  button "Apply Changes", 37, 44 178 55 12
  button "Close", 38, 99 178 47 12, cancel
  edit "", 6, 50 141 16 10, tab 23
  edit "", 5, 50 128 16 10, tab 23
  edit "", 4, 50 115 16 10, tab 23
  edit "", 3, 50 103 16 10, tab 23
  edit "", 2, 50 91 16 10, tab 23
  edit "", 1, 50 79 16 10, tab 23
  edit "", 12, 114 141 16 10, tab 23
  edit "", 13, 176 79 16 10, tab 23
  edit "", 14, 176 91 16 10, tab 23
  edit "", 15, 176 103 16 10, tab 23
}
dialog m.error {
  title "You screwed up!"
  size -1 -1 104 53
  option dbu
  ;icon 1, 7 9 16 16, explorer, 8
  button "OK", 2, 36 37 37 12, ok cancel
  edit %wtf, 3, 28 6 75 29, read multi return autovs vsbar center
}
dialog mhak.color {
  size -1 -1 270 215
  title "mHAK.Palette"
  text "Red",1,5 65 50 17
  text "Green",2,5 105 50 17
  text "Blue",3,5 145 50 17
  text "Palette:",4,0 0 43 20
  list 5,35 65 230 30,size
  list 6,35 105 230 30,size
  list 7,35 145 230 30,size
  box "Color",8,0 45 270 140
  list 9,49 0 100 20,vsbar size 
  list 13,49 20 100 20,vsbar size 
  text "Color:",14,0 20 43 20
  button "Close",10,190 185 80 30, cancel 
  button "Apply Changes",11,50 185 139 30
  text "",12,150 0 120 50
}
dialog mHAK.main {
  tab 1,80, -80 0 0 0, hide
  tab 2,81, hide
  tab 3,82, hide
  tab 4,83, hide
  icon 48,10 10 30 30, $mhakdir $+ yoshi.ico, 0, noborder tab 81
  button "Button",99,186 544 0 0, cancel  ok 
  button "Text Editor",31,40 10 230 30, disable tab 81
  button "Enemy Stats Editor",50,40 10 230 30, tab 83
  icon 400,10 10 30 30, $mhakdir $+ ufo.ico, 0, noborder tab 83
  icon 40,10 100 30 30, $mhakdir $+ yoshi.ico, 0, noborder tab 81
  button "Level Editor",32,40 55 230 30, tab 81
  icon 41,10 55 30 30, $mhakdir $+ yoshi.ico, 0, noborder tab 81
  button "Generator Editor",33,40 100 230 30, disable tab 81
  icon 43,10 140 30 30, $mhakdir $+ yoshi.ico, 0, tab 81
  button "Door Editor",34,40 140 230 30, disable tab 81
  button "Middle Ring Editor",35,40 180 230 30, disable tab 81
  button "Fun Stuff Editor",36,40 220 230 30, disable tab 81
  icon 44,10 180 30 30, $mhakdir $+ yoshi.ico, 0, tab 81
  icon 45,10 220 30 30, $mhakdir $+ yoshi.ico, 0, tab 81
  icon 46,10 260 30 30, $mhakdir $+ yoshi.ico, 0, tab 81
  button "Palette Editor",37,40 260 230 30, tab 81
  icon 47,10 300 30 30, $mhakdir $+ yoshi.ico, 0, tab 81
  button "Sprite Editor",38,40 300 230 30, disable tab 81
  list 12,0 340 270 20,size 
  size -1 -1 270 360
  title "mHAK"
  icon $mhakdir $+ yoshi.ico, 0
  menu "&File", 10
  item "&Open...", 1, 10
  item "Open Rom+&SRAM...", 2, 10
  item "Open Save S&tate...", 3, 10
  item "&Close", 4, 10
  item $recent, 5, 10
  item "&Rom Information...", 100, 10
  item "&Exit", 6, 10, ok
  menu "&Options", 11
  item ":D", 7, 11
  menu "&Windows", 13
  item "mBROWSER", 8, 13
  menu "&Help", 14
  item "&About...", 9, 14
}
dialog mHAK.about {
  title "About..."
  size -1 -1 100 66
  option dbu
  text "Coded by: Penguin", 1, 1 7 100 8, center
  text "Tested by n42 and MrAccident", 2, 0 17 100 8, center
  text "Ebisumaru too!", 4, 0 27 100 8, center
  button OK, 3, 37 54 24 12, ok
}
dialog mhak.ebnme {
  title "mHAK.EB Enemy"
  size -1 -1 250 200
  option dbu
  list 1, 25 1 50 11, vsbar
  text "Enemy:", 2, 0 1 25 10
  button "", 3, 149 180 0 0, hide ok
  tab "General", 8, 0 15 249 184
  radio "Neutral", 7, 96 39 31 10, tab 8
  radio "Female", 6, 67 39 28 10, tab 8
  check "'The' Flag", 4, 0 39 36 10, tab 8
  radio "Male", 5, 41 39 25 10, tab 8
  edit "", 12, 30 50 50 10, tab 8 limit 25
  edit "", 13, 30 60 50 10, tab 8
  text "Name:", 14, 1 50 29 10, tab 8
  text "Type:", 15, 1 61 29 10, tab 8
  text "HP:", 16, 1 72 29 10, tab 8
  edit "", 17, 30 70 50 10, tab 8
  tab "Actions", 9
  tab "Graphics", 10
  tab "???", 11
}

dialog mbrowse {
  title "mBROWSE"
  size -1 -1 256 256
  option dbu
  icon $mhakdir $+ bvirus.ico, 0
}
dialog mHAK.gen {
  title "Enemy Generator Editor"
  size -1 -1 147 137
  option dbu
  icon $mhakdir $+ yoshi.ico, 0
  list 2, 28 1 80 12, vsbar
  text What:, 3, 8 2 17 8
  icon 36, 4 99 15 15, $mhakdir $+ missile.ico, 0, hide
  text "Text Label", 42, 3 118 11 8
  icon 35, 22 99 15 15, $mhakdir $+ missile.ico, 0, hide
  scroll "", 33, 1 127 141 9, range 0 255 horizontal bottom
  text "Text Label", 43, 22 118 11 8
  icon 34, 40 99 15 15, $mhakdir $+ missile.ico, 0, hide
  text "Text Label", 44, 40 118 11 8
  icon 37, 58 99 15 15, $mhakdir $+ missile.ico, 0, hide
  text "Text Label", 45, 58 118 11 8
  icon 38, 76 99 15 15, $mhakdir $+ missile.ico, 0, hide
  text "Text Label", 46, 76 118 11 8
  icon 39, 94 99 15 15, $mhakdir $+ missile.ico, 0, hide
  text "Text Label", 47, 94 118 11 8
  icon 40, 112 99 15 15, $mhakdir $+ missile.ico, 0, hide
  text "Text Label", 49, 112 118 11 8
  icon 41, 130 99 15 15, $mhakdir $+ missile.ico, 0, hide
  text "Text Label", 48, 130 118 11 8
  button "k", 1, 64 83 0 0, ok cancel
  text "0", 4, 3 98 18 19
  text "3", 5, 57 98 18 19
  text "2", 6, 39 98 18 19
  text "1", 10, 21 98 18 19
  text "4", 11, 75 98 18 19
  text "5", 12, 93 98 18 19
  text "6", 13, 111 98 18 19
  text "7", 14, 129 98 18 19
  edit "", 50, 20 40 16 10, tab 30 limit 2
  menu "File", 7
  item "Open", 8, 7
  item "Save", 9, 7
}
alias -l mdx {
  dll " $+ $mhakdir $+ mdx.dll $+ " $1-
  return $null
}

on *:SIGNAL:xGUI: {
  if ($2 == sclick) {
    echo -a $3-
  }
  return $null
}
alias -l mdxinit {
  mdx SetMircVersion $version
  mdx MarkDialog $dname
  mdx SetDialog $dname bgcolor $rgb(213,222,245)
  return $null
}
alias -l recent {
  var %tmp.rec = $readini($mhakdir $+ YI.ini, settings, lastfile)
  if (%tmp.rec) {
    return 1: %tmp.rec
  }
  else {
    return 1: ...
  }
  return $null
}
alias spr {
  if ($2 == 2) {
    return $base($mid($reverse($base($hexnum(%sprite,$1,2),16,2,8)),5,4),2,10)
  }
  else {
    return $base($left($reverse($base($hexnum(%sprite,$1,2),16,2,8)),4),2,10)
  }
  return $null
}
alias dial {
  var %quack = $dialog($1,$2,-4)
  return 1
}
alias -l object {
  if ($right($1,2) == 00) {
    return $left($1,2)
  }
  elseif ($even($base($right($1,2),16,10)) == 1) {
    if ($len($left($1,2)) == 1) {
      return 0 $+ $left($1,2)
    }
    else {
      return $left($1,2)
    }
  }
  else {
    return $base($calc($base($left($1,2),16,10) + 256),10,16)
  }
}
alias -l mdxbars {
  return $mhakdir $+ bars.mdx
}
alias -l objectrans {
  var %ret = $base($1,16,10)
  return $readini($mhakdir $+ YI.ini,spritelist,%ret)
}
alias -l gen {
  return $base($calc($base($readini($mhakdir $+ YI.ini,Generators,$1),16,10)+1),10,16)
}
alias -l readobject {
  var %rdo.tmp = $base($calc($base($readini($mhakdir $+ YI.ini,$2,ooffset),16,10) + (($3 - 1) * 3)),10,16)
  var %ret = $objectrans($object($romdata($1 $+ $chr(124) $+ %rdo.tmp $+ $chr(124) $+ 2)))
  var %ret = %ret $calc($base($romdata($1 $+ $chr(124) $+ $base($calc($base(%rdo.tmp,16,10) + 1),10,16) $+ $chr(124) $+ 1),16,10)*1)
  var %ret = %ret $calc($base($romdata($1 $+ $chr(124) $+ $base($calc($base(%rdo.tmp,16,10) + 2),10,16) $+ $chr(124) $+ 1),16,10)*1)
  return %ret
}
alias -l plainobject {
  var %ret = $objectrans($object($left($1,4)))
  var %ret = %ret $base($mid($1,3,2),16,10)
  var %ret = %ret $base($right($1,2),16,10)
  return %ret
}
alias palrep {
  ;if (%format == SNES) {
  return $snes2rgb($romdata($3- $+ $chr(124) $+ $base($calc($1 + (($2 - 1) * 2)),10,16) $+ |2))
  if ($prop == snes) {
    return $romdata($3- $+ $chr(124) $+ $base($calc($1 + (($2 - 1) * 2)),10,16) $+ |2)
  }
  ;}
  ;else {
  ;return $gettok($readini(mIRC.ini,palettes,n0),$1,44)
  ;}
}
alias ebuncomp {
  var %Z = $base($left($base($1,16,2),3) $+ 00000,2,16,2)
  var %i = $base($right($base($1,16,2),5),2,16)
  echo -a %Z %i
}
alias hexsub {
  if (!$prop) {
    return $base($calc($base($1,16,10) - $base($2,16,10)),10,16)
  } 
  else {
    return $base($calc($base($2,16,10) - $base($1,16,10)),10,16)
  }
}
alias spritedraw {
  ;drawrect -f @spritetest $2 0 $calc(($1 - 1) * ($window(@spritetest).w / 8)) 0 $calc($window(@spritetest).w / 8) $calc($window(@spritetest).h / 8)
  set %inc 1
  drawrect -fr @spritetest $palrep($2) 0 0 $calc(($1 - 1) * 8) 8 8
  drawrect -fr @spritetest $palrep($3) 0 8 $calc(($1 - 1) * 8) 8 8
  drawrect -fr @spritetest $palrep($4) 0 16 $calc(($1 - 1) * 8) 8 8
  drawrect -fr @spritetest $palrep($5) 0 24 $calc(($1 - 1) * 8) 8 8
  drawrect -fr @spritetest $palrep($6) 0 32 $calc(($1 - 1) * 8) 8 8
  drawrect -fr @spritetest $palrep($7) 0 40 $calc(($1 - 1) * 8) 8 8
  drawrect -fr @spritetest $palrep($8) 0 48 $calc(($1 - 1) * 8) 8 8
  drawrect -fr @spritetest $palrep($9) 0 56 $calc(($1 - 1) * 8) 8 8
  drawrect -fr @spritetest $palrep($10) 0 64 $calc(($1 - 1) * 8) 8 8
  drawrect -fr @spritetest $palrep($11) 0 72 $calc(($1 - 1) * 8) 8 8
  drawrect -fr @spritetest $palrep($12) 0 80 $calc(($1 - 1) * 8) 8 8
  drawrect -fr @spritetest $palrep($13) 0 88 $calc(($1 - 1) * 8) 8 8
  drawrect -fr @spritetest $palrep($14) 0 96 $calc(($1 - 1) * 8) 8 8
  drawrect -fr @spritetest $palrep($15) 0 104 $calc(($1 - 1) * 8) 8 8
  drawrect -fr @spritetest $palrep($16) 0 112 $calc(($1 - 1) * 8) 8 8
  drawrect -fr @spritetest $palrep($17) 0 120 $calc(($1 - 1) * 8) 8 8
  ;drawrect -fr @spritetest $palrep($18) 0 128 $calc(($1 - 1) * 8) 8 8
  ;drawrect -fr @spritetest $palrep($19) 0 136 $calc(($1 - 1) * 8) 8 8
  ;drawrect -fr @spritetest $palrep($20) 0 144 $calc(($1 - 1) * 8) 8 8
  ;drawrect -fr @spritetest $palrep($21) 0 152 $calc(($1 - 1) * 8) 8 8
  ;drawrect -fr @spritetest $palrep($22) 0 160 $calc(($1 - 1) * 8) 8 8
  ;drawrect -fr @spritetest $palrep($23) 0 168 $calc(($1 - 1) * 8) 8 8
  ;drawrect -fr @spritetest $palrep($24) 0 176 $calc(($1 - 1) * 8) 8 8
  ;drawrect -fr @spritetest $palrep($25) 0 184 $calc(($1 - 1) * 8) 8 8
  return $null
}
;alias spritedraw2 {
;  set %inc 1
;  drawrect -fr @spritetest $palrep($2) 0 0 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($3) 0 8 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($4) 0 16 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($5) 0 24 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($6) 0 32 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($7) 0 40 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($8) 0 48 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($9) 0 56 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($10) 0 64 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($11) 0 72 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($12) 0 80 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($13) 0 88 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($14) 0 96 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($15) 0 104 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($16) 0 112 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($17) 0 120 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($18) 0 128 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($19) 0 136 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($20) 0 144 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($21) 0 152 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($22) 0 160 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($23) 0 168 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($24) 0 176 $calc((($1 - 1) * 8) + 64) 8 8
;  drawrect -fr @spritetest $palrep($25) 0 184 $calc((($1 - 1) * 8) + 64) 8 8
;}
alias testing {
  if (%format == SNES) {
    return $pixelize( [ $sep($romdata(%rom $+ $chr(124) $+ %spr.addr $+ |32)) ] ,$1) $&
      $pixelize( [ $sep($romdata(%rom $+ $chr(124) $+ $base($calc($base(%spr.addr,16,10) + 32),10,16) $+ |32)) ] ,$1) $&
      $pixelize( [ $sep($romdata(%rom $+ $chr(124) $+ $base($calc($base(%spr.addr,16,10) + 64),10,16) $+ |32)) ] ,$1)
  }
  elseif (%format == GBC) {
    return $pixelize( [ $sep($romdata(%rom $+ $chr(124) $+ %spr.addr $+ |32)) ] ,$1) $&
      $pixelize( [ $sep($romdata(%rom $+ $chr(124) $+ $base($calc($base(%spr.addr,16,10) + 16),10,16) $+ |16)) ] ,$1) $&
      $pixelize( [ $sep($romdata(%rom $+ $chr(124) $+ $base($calc($base(%spr.addr,16,10) + 32),10,16) $+ |16)) ] ,$1)
  }
}
alias testing2 {
  if (%format == SNES) {
    return $pixelize( [ $sep($romdata(%rom $+ $chr(124) $+ $base($calc($base(%spr.addr,16,10) + %wid),10,16) $+ |32)) ] ,$1) $&
      $pixelize( [ $sep($romdata(%rom $+ $chr(124) $+ $base($calc($base(%spr.addr,16,10) + %wid + 32),10,16) $+ |32)) ] ,$1) $&
      $pixelize( [ $sep($romdata(%rom $+ $chr(124) $+ $base($calc($base(%spr.addr,16,10) + %wid + 64),10,16) $+ |32)) ] ,$1)
  }
  elseif (%format == GBC) {
    return $pixelize( [ $sep($romdata(%rom $+ $chr(124) $+ $base($calc($base(%spr.addr,16,10) + %wid),10,16) $+ |16)) ] ,$1) $&
      $pixelize( [ $sep($romdata(%rom $+ $chr(124) $+ $base($calc($base(%spr.addr,16,10) + %wid + 16),10,16) $+ |16)) ] ,$1) $&
      $pixelize( [ $sep($romdata(%rom $+ $chr(124) $+ $base($calc($base(%spr.addr,16,10) + %wid + 32),10,16) $+ |16)) ] ,$1)
  }
}
alias fulls {
  set %spr.addr $1-
  drawrect -f @spritetest 1 0 0 0 $window(@spritetest).w $window(@spritetest).h
  spritedraw 1 $testing(1)
  spritedraw 2 $testing(2)
  spritedraw 3 $testing(3)
  spritedraw 4 $testing(4)
  spritedraw 5 $testing(5)
  spritedraw 6 $testing(6)
  spritedraw 7 $testing(7)
  spritedraw 8 $testing(8)
  ;spritedraw2 1 $testing2(1)
  ;spritedraw2 2 $testing2(2)
  ;spritedraw2 3 $testing2(3)
  ;spritedraw2 4 $testing2(4)
  ;spritedraw2 5 $testing2(5)
  ;spritedraw2 6 $testing2(6)
  ;spritedraw2 7 $testing2(7)
  ;spritedraw2 8 $testing2(8)
}
alias pixel {
  var %d = 1
  var %tmp.pix $1
  if ($1 <= 64) {
    while (%tmp.pix >= 9) {
      inc %d
      var %tmp.pix $calc(%tmp.pix - 8)
    }
    if (!%d) {
      var %d = 1
    }
    return %d %tmp.pix
  }
  else {
    return $null
  }
}
on *:keydown:@spritetest:189,109: {
  fulls $base($calc($base($remove(%spr.addr,0x),16,10) - $base(20,16,10)),10,16)
}
on *:keydown:@spritetest:107,187: {
  fulls $base($calc($base($remove(%spr.addr,0x),16,10) + $base(20,16,10)),10,16)
}
on *:keydown:@spritetest:49: {
  dec %palloc 32
  fulls %spr.addr
}
on *:keydown:@spritetest:50: {
  inc %palloc 32
  fulls %spr.addr
}
on *:keydown:@spritetest:32: {
  fulls %spr.addr
}

alias sep {
  var %str = $1-
  set %l.len $len(%str)
  set %l.tmp 1
  :init
  if (%l.tmp <= %l.len) {
    var %char = $mid(%str,%l.tmp,2)
    if (%ret) {
      var %ret = %ret $+ $chr(44) $+ %char
    }
    else {
      var %ret = %char
    }
    inc %l.tmp 2
    goto init
  }
  return %ret
}
alias pixelize {
  if (%format == SNES) {
    var %bp1 = $1 $3 $5 $7 $9 $11 $13 $15
    var %bp2 = $2 $4 $6 $8 $10 $12 $14 $16
    var %bp3 = $17 $19 $21 $23 $25 $27 $29 $31
    var %bp4 = $18 $20 $22 $24 $26 $28 $30 $32
    if ($33 == 1) {
      var %1 = $1
      var %2 = $2
      var %3 = $17
      var %4 = $18
    }
    elseif ($33 == 2) {
      var %1 = $3
      var %2 = $4
      var %3 = $19
      var %4 = $20
    }
    elseif ($33 == 3) {
      var %1 = $5
      var %2 = $6
      var %3 = $21
      var %4 = $22
    }
    elseif ($33 == 4) {
      var %1 = $7
      var %2 = $8
      var %3 = $23
      var %4 = $24
    }
    elseif ($33 == 5) {
      var %1 = $9
      var %2 = $10
      var %3 = $25
      var %4 = $26
    }
    elseif ($33 == 6) {
      var %1 = $11
      var %2 = $12
      var %3 = $27
      var %4 = $28
    }
    elseif ($33 == 7) {
      var %1 = $13
      var %2 = $14
      var %3 = $29
      var %4 = $30
    }
    elseif ($33 == 8) {
      var %1 = $15
      var %2 = $16
      var %3 = $31
      var %4 = $32
    }
    var %ret =      $base($mid($base(%4,16,2,8),1,1) $+ $mid($base(%3,16,2,8),1,1) $+ $mid($base(%2,16,2,8),1,1) $+ $mid($base(%1,16,2,8),1,1),2,10,1)
    var %ret = %ret $base($mid($base(%4,16,2,8),2,1) $+ $mid($base(%3,16,2,8),2,1) $+ $mid($base(%2,16,2,8),2,1) $+ $mid($base(%1,16,2,8),2,1),2,10,1)
    var %ret = %ret $base($mid($base(%4,16,2,8),3,1) $+ $mid($base(%3,16,2,8),3,1) $+ $mid($base(%2,16,2,8),3,1) $+ $mid($base(%1,16,2,8),3,1),2,10,1)
    var %ret = %ret $base($mid($base(%4,16,2,8),4,1) $+ $mid($base(%3,16,2,8),4,1) $+ $mid($base(%2,16,2,8),4,1) $+ $mid($base(%1,16,2,8),4,1),2,10,1)
    var %ret = %ret $base($mid($base(%4,16,2,8),5,1) $+ $mid($base(%3,16,2,8),5,1) $+ $mid($base(%2,16,2,8),5,1) $+ $mid($base(%1,16,2,8),5,1),2,10,1)
    var %ret = %ret $base($mid($base(%4,16,2,8),6,1) $+ $mid($base(%3,16,2,8),6,1) $+ $mid($base(%2,16,2,8),6,1) $+ $mid($base(%1,16,2,8),6,1),2,10,1)
    var %ret = %ret $base($mid($base(%4,16,2,8),7,1) $+ $mid($base(%3,16,2,8),7,1) $+ $mid($base(%2,16,2,8),7,1) $+ $mid($base(%1,16,2,8),7,1),2,10,1)
    var %ret = %ret $base($mid($base(%4,16,2,8),8,1) $+ $mid($base(%3,16,2,8),8,1) $+ $mid($base(%2,16,2,8),8,1) $+ $mid($base(%1,16,2,8),8,1),2,10,1)
    return %ret
  }
  elseif (%format == GBC) {
    var %bp1 = $1 $3 $5 $7 $9 $11 $13 $15
    var %bp2 = $2 $4 $6 $8 $10 $12 $14 $16
    var %1 = $gettok(%bp1,$17,32)
    var %2 = $gettok(%bp2,$17,32)
    var %ret =      $mid($base(%2,16,2,8),1,1) $+ $mid($base(%1,16,2,8),1,1),2,10,1)
    var %ret = %ret $mid($base(%2,16,2,8),2,1) $+ $mid($base(%1,16,2,8),2,1),2,10,1)
    var %ret = %ret $mid($base(%2,16,2,8),3,1) $+ $mid($base(%1,16,2,8),3,1),2,10,1)
    var %ret = %ret $mid($base(%2,16,2,8),4,1) $+ $mid($base(%1,16,2,8),4,1),2,10,1)
    var %ret = %ret $mid($base(%2,16,2,8),5,1) $+ $mid($base(%1,16,2,8),5,1),2,10,1)
    var %ret = %ret $mid($base(%2,16,2,8),6,1) $+ $mid($base(%1,16,2,8),6,1),2,10,1)
    var %ret = %ret $mid($base(%2,16,2,8),7,1) $+ $mid($base(%1,16,2,8),7,1),2,10,1)
    var %ret = %ret $mid($base(%2,16,2,8),8,1) $+ $mid($base(%1,16,2,8),8,1),2,10,1)
    return %ret
  }
}
alias -l even {
  if ($1 == 0) {
    return 0
  }
  if ($round($calc($1 / 2),0) != $calc($1 / 2)) {
    return 0
  }
  else {
    return 1
  }
}
alias -l charhex {
  if ($len($1-) <= 1) { 
    return $base($asc($1),10,16)
  }
  else {
    set %l.len $len($1-)
    set %l.tmp 1
    :init
    if (%l.tmp <= %l.len) {
      var %char = $mid($1-,%l.tmp,1)
      var %ret = %ret $+ $base($asc(%char),10,16)
      inc %l.tmp
      goto init
    }
    return %ret
  }
}
alias hexchar {
  var %str = $remove($1-,$chr(32))
  if ($len(%str) <= 2) { 
    return $replace($chr($base(%str,16,10)),$lf, $ $+ lf,$cr, $ $+ cr)
  }
  else {
    set %l.len $len(%str)
    set %l.tmp 1
    :init
    if (%l.tmp <= %l.len) {
      var %char = $mid(%str,%l.tmp,2)
      var %ret = %ret $+ $replace($chr($base(%char,16,10)),$lf, $ $+ lf,$cr, $ $+ cr)
      inc %l.tmp 2
      goto init
    }
    return %ret
  }
}
alias Text {
  var %ini = $curini
  if ($prop) {
    var %ini = $mhakdir $+ $prop $+ .ini
  }
  set %lt.len $len($1-)
  set %lt.tmp 1
  while (%lt.tmp <= %lt.len) {
    var %lt.char = $mid($1-,%lt.tmp,2)
    if (%lt.char == 00) {
    }
    elseif ($readini(%ini,letters,%lt.char) == $null) {
      var %lt.output = %lt.output $+ $chr(91) $+ %char $+ $chr(93)
    }
    else {
      var %lt.output = %lt.output $+ $replace($readini(%ini,letters,%lt.char),$chr(36) $+ chr(32), $chr(32))
    }
    inc %lt.tmp 2
  }
  return %lt.output
}
alias gfxread {
  return $base($left($base($1,16,2,8),4),2,10) $base($right($base($1,16,2,8),4),2,10)
}
alias mHAK {
  dialog -md mHAKmain mHAK.main
}
on *:dialog:mHAKlvl:*:*: {
  if ($devent == init) {
    set %tmp.lvl 1
    while ($gettok($readini($mhakdir $+ YI.ini,Levels,1),%tmp.lvl,44) != $null) {
      did -a $dname 18 $gettok($readini($mhakdir $+ YI.ini,Levels,1),%tmp.lvl,44)
      inc %tmp.lvl
    }
    dialog -t $dname Level Editor: %mhak.rom
  }
  elseif ($devent == sclick) {
    if ($did == 18) {
      set %header16-1 $romdata(%mhak.rom $+ $chr(124) $+ $readini($mhakdir $+ YI.ini,$did(18).seltext,hoffset) $+ |5)
      set %header16-2 $romdata(%mhak.rom $+ $chr(124) $+ $base($calc($base($readini($mhakdir $+ YI.ini,$did(18).seltext,hoffset),16,10) + 5),10,16) $+ |5)
      set %header2 $base(%header16-1,16,2,40) $+ $base(%header16-2,16,2,40)
      did -ra $dname 1 $base($left(%header2,5),2,10,2)
      did -ra $dname 2 $base($mid(%header2,6,4),2,10,2)
      did -ra $dname 3 $base($mid(%header2,10,5),2,10,2)
      did -ra $dname 4 $base($mid(%header2,15,5),2,10,2)
      did -ra $dname 5 $base($mid(%header2,20,6),2,10,2)
      did -ra $dname 6 $base($mid(%header2,26,6),2,10,2)
      did -ra $dname 7 $base($mid(%header2,32,6),2,10,2)
      did -ra $dname 8 $base($mid(%header2,38,7),2,10,2)
      did -ra $dname 9 $base($mid(%header2,45,4),2,10,2)
      did -ra $dname 10 $base($mid(%header2,49,5),2,10,2)
      did -ra $dname 11 $base($mid(%header2,54,2),2,10,2)
      did -ra $dname 12 $base($mid(%header2,56,2),2,10,2)
      did -ra $dname 13 $base($mid(%header2,58,7),2,10,2)
      did -ra $dname 14 $base($mid(%header2,65,2),2,10,2)
      did -ra $dname 15 $base($mid(%header2,67,2),2,10,2)
      did -ra $dname 16 $base($mid(%header2,69,5),2,10,2)
      did -ra $dname 17 $base($right(%header2,7),2,10,2)
    }
    if ($did == 37) {
      var %k = $romwrite(%mhak.rom $+ $chr(124) $+ $readini($mhakdir $+ YI.ini,$did(18).seltext,hoffset) $+ $chr(124) $+ 1 $+ $chr(124) $+ $allheader)
    }
  }
  elseif ($devent == edit) {
    if ($did($did).text > $base($str(1,$readini($mhakdir $+ YI.ini,Header,$did)),2,10)) {
      did -ra $dname $did $base($str(1,$readini($mhakdir $+ YI.ini,Header,$did)),2,10))
    }
  }
  elseif ($devent == close) {
    return $true
  }
  return $null
}
on *:dialog:mHAKmain:*:*: {
  if ($devent == sclick) {
    if ($did == 31) {
      error Temporarily disabled for your protection.
      ;dial mHAKtxt mHAK.text
    } 
    if ($did == 32) {
      if (%mhak.rom.type == YI11U) {
        dial mHAKlvl mHAK.level
      }
      else {
        error Sorry, this only works with Yoshi's Island (V1.1) (U)
      }
    }
    elseif ($did == 33) {
      dial mHAKgen mHAK.gen
    }
    elseif ($did == 37) {
      dial mHAKpal mHAK.color
    }
    elseif ($did == 50) {
      dial mHAknme mHAK.ebnme
    }
  }
  elseif ($devent == menu) {
    if ($did == 1) {
      var %open = $sfile($readini($mhakdir $+ YI.ini,settings,lastdir) $+ *.smc)
      if (%open) {
        loadrom %open
        writeini $mhakdir $+ YI.ini Settings lastdir $gettok(%open,1- $+ $calc($numtok(%open,92) - 1),92) $+ \
      }
    }
    if ($did == 2) {
      var %open = $sfile($readini($mhakdir $+ YI.ini,settings,lastdir) $+ *.smc)
      if (%open) {
        loadrom %open
        writeini $mhakdir $+ YI.ini Settings lastdir $gettok(%open,1- $+ $calc($numtok(%open,92) - 1),92) $+ \
        loadsram
      }
    }
    elseif ($did == 4) {
      closerom
    }
    elseif ($did == 9) {
      var %open = $dialog(about,mHAK.about,-4)
    }
    elseif ($did == 8) {
      if (!$dialog(mbrowse)) {
        openmbrowse
      }
    }
    elseif ($did == 7) {
      if (!$smile) {
        smiley
        error omg! you smile
      }
      else {
        unsmiley
      }
    }
    elseif ($did == 5) {
      loadrom $readini($mhakdir $+ YI.ini,Settings,lastfile)
    }
    elseif ($did == 2) {
      ;var %open = $sfile($readini($mhakdir $+ YI.ini,settings,lastdirs) $+ *.smc)
      ;if (%open) {
      ;loadsram %open
      ;writeini $mhakdir $+ YI.ini Settings lastdirs $gettok(%open,1- $+ $calc($numtok(%open,92) - 1),92) $+ \
      ;}
    }
    elseif ($did == 3) {
      ;var %open = $sfile($readini($mhakdir $+ YI.ini,settings,lastdirst) $+ *.smc)
      ;if (%open) {
      ;loadstate %open
      ;writeini $mhakdir $+ YI.ini Settings lastdirst $gettok(%open,1- $+ $calc($numtok(%open,92) - 1),92) $+ \
      ;}
    }
    elseif ($did == 100) {
      dial info mHAK.info
    }
  }
  elseif ($devent == close) {
    if (%mhak.rom) {
      closerom
    }
  }
  elseif ($devent == init) {
    mdxinit
    mdx SetControlMDX $dname 12 StatusBar > $mdxbars
    mdx SetBorderStyle $dname 12 windowedge
    did -i $dname 12 1 setparts 280
    did -i $dname 12 2 +p 1 Status: No Rom Loaded
  }
  return $null
}
on *:dialog:mHAKtxt:*:*: {
  if ($devent == init) {
    ;mdxinit
    ;mdx SetControlMDX $dname 1 ListView list noheader nosortheader single grid > C:\mIRC\views.mdx
    loadtext
    dialog -t $dname Text editor: %mhak.rom
  }
  elseif ($devent == sclick) {
    if ($did == 1) {
      did -ran $dname 2 $did(1).seltext
    }
  }
  elseif ($devent == close) {
    var %what = 1
  }
  return $null
}
on *:dialog:mHAKgen:*:*: {
  if ($devent == sclick) {
  }
  elseif ($devent == scroll) {
    if ($did == 33) {
      did -ra $dname 49 $calc($did(33).sel + 7)
      did -ra $dname 48 $calc($did(33).sel + 6)
      did -ra $dname 47 $calc($did(33).sel + 5)
      did -ra $dname 46 $calc($did(33).sel + 4)
      did -ra $dname 45 $calc($did(33).sel + 3)
      did -ra $dname 44 $calc($did(33).sel + 2)
      did -ra $dname 43 $calc($did(33).sel + 1)
      did -ra $dname 42 $did(33).sel
      did -ra $dname 14 $readini($mhakdir $+ YI.ini,spritelist,$calc($did(33).sel + 7))
      did -ra $dname 13 $readini($mhakdir $+ YI.ini,spritelist,$calc($did(33).sel + 6))
      did -ra $dname 12 $readini($mhakdir $+ YI.ini,spritelist,$calc($did(33).sel + 5))
      did -ra $dname 11 $readini($mhakdir $+ YI.ini,spritelist,$calc($did(33).sel + 4))
      did -ra $dname 5 $readini($mhakdir $+ YI.ini,spritelist,$calc($did(33).sel + 3))
      did -ra $dname 6 $readini($mhakdir $+ YI.ini,spritelist,$calc($did(33).sel + 2))
      did -ra $dname 10 $readini($mhakdir $+ YI.ini,spritelist,$calc($did(33).sel + 1))
      did -ra $dname 4 $readini($mhakdir $+ YI.ini,spritelist,$did(33).sel)
      loadsprite 36 $dname $did(33).sel 1
      loadsprite 35 $dname $calc($did(33).sel + 1) 2
      loadsprite 34 $dname $calc($did(33).sel + 2) 3
      loadsprite 37 $dname $calc($did(33).sel + 3) 4
      loadsprite 38 $dname $calc($did(33).sel + 4) 5
      loadsprite 39 $dname $calc($did(33).sel + 5) 6
      loadsprite 40 $dname $calc($did(33).sel + 6) 7
      loadsprite 41 $dname $calc($did(33).sel + 7) 8
    }
    elseif ($devent == init) {
      loadbg $dname
      did -a $dname 2 Egg Plant Generator
    }
    if ($devent == sclick) {
      if ($did == 2) {

      }
    }
  }
  return $null
}
on *:dialog:mHAKpal:*:*: {
  if ($devent == init) {
    mdxinit
    mdx SetControlMDX $dname 5 TrackBar autoticks > $mdxbars
    mdx SetBorderStyle $dname 5 windowedge
    mdx SetControlMDX $dname 6 TrackBar autoticks > $mdxbars
    mdx SetBorderStyle $dname 6 windowedge
    mdx SetControlMDX $dname 7 TrackBar autoticks > $mdxbars
    mdx SetBorderStyle $dname 7 windowedge
    did -i $dname 5 1 params 0 0 31 * * * * 15
    did -i $dname 5 1 tickfreq 1
    did -i $dname 6 1 params 0 0 31 * * * * 15
    did -i $dname 6 1 tickfreq 1
    did -i $dname 7 1 params 0 0 31 * * * * 15
    did -i $dname 7 1 tickfreq 1
    set %tmp.pal 1
    while ($gettok($readini($curini,palettes,index),%tmp.pal,44) != $null) {
      did -a $dname 9 $gettok($readini($curini,palettes,index),%tmp.pal,44)
      inc %tmp.pal
    }
    unset %tmp.pal
    set %inc 1
    while (%inc <= 16) {
      did -a $dname 13 %inc
      inc %inc
    }
  }
  elseif ($devent == sclick) {
    if (($did == 5) || ($did == 6) || ($did == 7)) {
      mdx SetColor mHAKpal 12 background $rgb($calc($gettok($did(5).seltext,1,32) * 8),$calc($gettok($did(6).seltext,1,32) * 8),$calc($gettok($did(7).seltext,1,32) * 8))
    }
  }
  return $null
}
on *:dialog:mHAKnme:*:*: {
  if ($devent == init) {
    mdxinit
    set %inc 1
    while (%inc <= 256) {
      did -a $dname 1 %inc
      inc %inc
    }
  }
  elseif ($devent == sclick) {
    if ($did == 1) {
      if ($enemybytes($did(1).seltext,0,1) == 01) {
        did -c $dname 4
      }
      else {
        did -u $dname 4
      }
      did -ra $dname 12 $text($enemybytes($did(1).seltext,1,25)).eb
      did -ra $dname 13 $replace($enemybytes($did(1).seltext,27,1),00,Normal,02,Metal,01,Insect)
      did -ra $dname 17 $base($rev($enemybytes($did(1).seltext,33,2)),16,10)
      ;did -ra $dname 0 $base($rev($enemybytes($did(1).seltext,35,2)),16,10) - PP
      ;did -ra $dname 0 $base($rev($enemybytes($did(1).seltext,37,4)),16,10) - EXP
      ;did -ra $dname 0 $base($rev($enemybytes($did(1).seltext,41,4)),16,10) - MONEY
    }
  }
  return $null
}
alias enemybytes {
  return $right($romdata(%mhak.rom $+ $chr(124) $+ $base($calc(($base($readini($curini,data,enemy),16,10)) + (($1 - 1) * 94)),10,16) $+ $chr(124) $+ $calc($3 + $2)),$calc($3 * 2))
}
alias -l smiley {
  return $null
}
alias -l unsmiley {
  return $null
}
alias -l smile {
  return $false
}
alias -l loadsprite {
  if ($readini($mhakdir $+ YI.ini,sprites,$3) != $null) {
    did -g $2 $1 $readini($mhakdir $+ YI.ini,sprites,$3)
  }
  else {
    did -g $2 $1 $mhakdir $+ missile.ico
  }
  set %var $+ $4 $3
  return $null
}
alias hex2addr {
  if ($prop == MTHR2) {
    return $base($calc($base($1,16,10) + $base(BFFE00,16,10)),10,16)
  }
  if ($prop == SPC) {
    return $base($calc($base($1,16,10) - $base(100,16,10)),10,16)
  }
  elseif ($prop == SMJU1) {
    return $base($calc($base($1,16,10) + $base(BFFE00,16,10)),10,16)
  }
  elseif (YI isin $prop) {
    if ($base($1,16,10) > $base(1FFFFF,16,10)) {
      ;if ($header) {
      return $base($calc($base($1,16,10) + $base(3FFE00,16,10)),10,16)
      ;}
      ;else {
      ;return $base($calc($base($1,16,10) + $base(400000,16,10)),10,16)
      ;}
    }
    else {
      if ($base($1,16,10) < $base(8000,16,10)) {
        return 00 $+ $base($calc($base(8000,16,10) + $base($right($1,4),16,10) - 512),10,16,4)
      }
      elseif (($base($1,16,10) >= $base(8000,16,10)) && ($base($1,16,10) < $base(FFFF,16,10))) {
        return 01 $+ $base($calc($base($right($1,4),16,10) - $base(8000,16,10) - 512),10,16,4)
      }
    }
  }
  else return $1
}
alias addr2hex {
  if ($prop == SPC) {
    return $base($calc($base($1,16,10) + $base(100,16,10)),10,16)
  }
}
alias mbrowse {
  if (!$window(@mBROWSER)) {
    window -peh @mBROWSER
    dll $mhakdir $+ mBROWSE.dll attach $dialog(mBROWSE).hwnd
    dll $mhakdir $+ mBROWSE.dll margins left:0 right:0 top:0 bottom:0
    dll $mhakdir $+ mBROWSE.dll handler mbstat
  }
  if (!$1) {
    dll $mhakdir $+ mBROWSE.dll navigate http://penguin.flatface.net/mb/
  }
  else {
    dll $mhakdir $+ mBROWSE.dll navigate $1-
  }
  return $null
}
alias -l chgmb {
  dll $mhakdir $+ mBROWSE.dll navigate $1-
  return $null
}
alias -l error {
  set %wtf $1-
  var %error = $dialog(error,m.error,-4)
  return $null
}
alias -l lheader {
  if (($1 != 0) && ($1 < 18)) {
    return $base($did(mHAKlvl,$1).text,10,2,$readini($mhakdir $+ YI.ini,Header,$1))
  }
  return $null
}
alias -l allheader {
  var %headerbin = $lheader(1) $+ $lheader(2) $+ $lheader(3) $+ $lheader(4) $+ $lheader(5) $+ $lheader(6) $+ $lheader(7) $+ $lheader(8) $+ $lheader(9) $+ $lheader(10) $+ $lheader(11) $+ $lheader(12) $+ $lheader(13) $+ $lheader(14) $+ $lheader(15) $+ $lheader(16) $+ $lheader(17)
  var %headerX1 = $base($left(%headerbin,40),2,16,10)
  var %headerX2 = $base($right(%headerbin,40),2,16,10)
  return %headerX1 $+ %headerX2
}
alias -l mbstat {
  if ($2 == status_change) {
    if ($3 != $null) {
      dialog -t mBROWSE mBROWSE: $dll($mhakdir $+ mBROWSE.dll,name,$window(@web).hwnd)
    }
    else {
      dialog -t mBROWSE mBROWSE: $dll($mhakdir $+ mBROWSE.dll,name,$window(@web).hwnd)
    }
    return S_OK
  }
  if ($2 == new_window) {
    return S_CANCEL
  }
  return S_OK
}
alias header {
  if ($1) {
    if ($exp($file($1).size)) {
      return $false
    }
    else {
      return $true
    }
  }
  return $null
}
alias -l exp {
  if ($calc($1 /1024 /8) != $int($calc($1 /1024 /8))) {
    return $false
  }
  else {
    return $true
  }
  return $null
}
alias -l loadrom {
  set %mhak.rom.type $readini($mainini,$romdata($1- $+ $chr(124) $+ 0x81DB $+ $chr(124) $+ 5),ID)
  var %mhak.hoff = 0x0081DB
  if (!%mhak.rom.type) {
    set %mhak.rom.type $readini($mainini,$romdata($1- $+ $chr(124) $+ 0x101DB $+ $chr(124) $+ 5),ID)
    var %mhak.hoff = 0x0101DB
  }
  if (%mhak.rom.type) {
    set %mhak.rom $1-
    set %mhak.rom.open 1
    writeini $mhakdir $+ YI.ini settings lastfile $1-
    dialog -t mHAKmain mHAK: $1-
    if ($header($1-)) {
      set %mhak.rom.header Yes
    }
    else {
      set %mhak.rom.header No
    }
    set %mhak.rom.name $readini($mainini,$romdata($1- $+ $chr(124) $+ %mhak.hoff $+ $chr(124) $+ 5),Game)
    did -i mHAKmain 12 2 Loaded: %mhak.rom.name $+ , Header: %mhak.rom.header
    did -f mHAKmain $calc(80 + $readini($mainini,$romdata($1- $+ $chr(124) $+ %mhak.hoff $+ $chr(124) $+ 5),t))
  }
  else {
    unset %mhak.rom.type
    dialog -t mHAKmain mHAK
    did -i mHAKmain 12 2 Status: No Rom Loaded
    error Unknown Rom.
    did -f mHAKmain 80
  }
  return $null
}
alias -l loadsram {
  set %mhak.sram $replace(%mhak.rom,smc,srm)
  if ($file(%mhak.sram)) {
    did -i mHAKmain 12 2 Loaded: %mhak.rom.name $+ , Header: %mhak.rom.header $+ , SRAM: %mhak.sram
  }
  else {
    unset %mhak.sram
  }
}
alias yipt {
  if ($base($1,16,10) > 2097152) {
    return $base($calc($base($1,16,10) + $base(200000,16,10)),10,16)
  }
}
alias -l closerom {
  unset %mhak.rom
  unset %mhak.rom.*
  dialog -t mHAKmain mHAK
  did -i mHAKmain 12 2 Status: No Rom Loaded
  did -f mHAKmain 80
}
alias -l chrl {
  return $mid($1,$2,1)
}
alias hexnum {
  return $mid($1,$calc(($2 * 2) - 1),2)
}
alias snes2rgb {
  var %tmp.clr = $base($rev($1),16,2,15)
  return $rgb($calc($base($right(%tmp.clr,5),2,10)*8),$calc($base($mid(%tmp.clr,6,5),2,10)*8),$calc($base($left(%tmp.clr,5),2,10)*8))
}
alias rgb2snes {
  return 0 $+ $base($round($calc($gettok($rgb($1),3,44) / 8),0),10,2,5) $+ $base($round($calc($gettok($rgb($1),2,44) / 8),0),10,2,5) $+ $base($round($calc($gettok($rgb($1),1,44) / 8),0),10,2,5)
}
alias -l openmbrowse {
  dialog -md mbrowse mbrowse
  mbrowse
}
alias rev { 
  var %i 1, %s 
  while $mid($1, %i, 2) != $null {
    %s = $ifmatch $+ %s 
    inc %i 2 
  } 
  return %s 
}
alias -l romdata {
  tokenize 124 $1-
  var %r = $1
  if ($chr(32) isin $1) {
    var %r = " $+ $1 $+ "
  }
  if (!$header($1)) {
    bread %r $calc($base($remove($2,0x),16,10) - $base(200,16,10)) $3 &data
  }
  else {
    bread %r $base($remove($2,0x),16,10) $3 &data
  }
  set %incd 0
  while (%incd != $bvar(&data,0)) {
    inc %incd
    if ($bvar(&data,%incd) != 0) {
      if ($len($charhex($chr($bvar(&data,%incd)))) == 1) {
        var %retu = %retu $+ 0 $+ $charhex($chr($bvar(&data,%incd)))
      }
      else {
        var %retu = %retu $+ $charhex($chr($bvar(&data,%incd)))
      }
    }
    else {
      var %retu = %retu $+ 00
    }
  }
  unset %incd
  return %retu
}
alias mhakdir {
  return $mircdir $+ mHAK\
}
alias hexascval {
  var %str = $remove($1-,$chr(32))
  if ($len(%str) <= 2) { 
    return $base(%str,16,10)
  }
  else {
    set %l.len $len(%str)
    set %l.tmp 1
    :init
    if (%l.tmp <= %l.len) {
      var %char = $mid(%str,%l.tmp,2)
      var %ret = %ret $base(%char,16,10)
      inc %l.tmp 2
      goto init
    }
    return %ret
  }
}
;usage: $romwrite(<rom>|<offset>|<bytes>|<data>)
;you must include the |s
alias romwrite {
  tokenize 124 $1-
  bset &tmpdata $3 $hexascval($4)
  var %r = $1
  if ($chr(32) isin $1) {
    var %r = " $+ $1 $+ "
  }
  if (!$header($1)) {
    bwrite $1 $calc($base($remove($2,0x),16,10) - $base(200,16,10)) -1 &tmpdata
  }
  else {
    bwrite $1 $base($remove($2,0x),16,10) -1 &tmpdata
  }
}
