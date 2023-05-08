extends Node

func play_music():
	if $MenuMusic.playing == true:
		$MenuMusic.stop()
	
	if $GameOverMusic.playing == true:
		$GameOverMusic.stop()
		
	if $LevelMusic.playing == false:
		$LevelMusic.play()
		$AmbientSound.play()
		
	if $BossMusic.playing == true:
		$BossMusic.stop()

func play_menu_music():
	if $LevelMusic.playing == true:
		$LevelMusic.stop()
		
	if $AmbientSound.playing == true:
		$AmbientSound.stop()
	
	if $GameOverMusic.playing == true:
		$GameOverMusic.stop()
	
	if $WinMusic.playing ==true:
		$WinMusic.stop()
	
	if $MenuMusic.playing == false:
		$MenuMusic.play()

func play_gameover_music():
	if $LevelMusic.playing == true:
		$LevelMusic.stop()
	
	if $AmbientSound.playing == true:
		$AmbientSound.stop()
	
	if $BossMusic.playing == true:
		$BossMusic.stop()
		
	$GameOverMusic.play()
	
func play_win_music():
	if $LevelMusic.playing == true:
		$LevelMusic.stop()
		
	if $AmbientSound.playing == true:
		$AmbientSound.stop()
		
	if $BossMusic.playing == true:
		$BossMusic.stop()
		
	$WinMusic.play()
	
func play_boss_fight_music():
	if $LevelMusic.playing == true:
		$LevelMusic.stop()
	
	if $AmbientSound.playing == true:
		$AmbientSound.stop()
		
	if $GameOverMusic.playing == true:
		$GameOverMusic.stop()
		
	$BossMusic.play()
	
