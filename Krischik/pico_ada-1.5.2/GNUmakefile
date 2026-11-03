############################################################# {{{1 ##########
#  Copyright © 2026 … 2026 Martin Krischik «krischik@users.sourceforge.net»
#############################################################################
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see «http://www.gnu.org/licenses/».
############################################################# }}}1 ##########

.PHONY: development release validation pretty doc clean help

all:
	$(MAKE) -C "pico_xbsp"				$(@)
	$(MAKE) -C "pico_ada_c01_blink"			$(@)
	$(MAKE) -C "pico_ada_c01_blink_lt"		$(@)
	$(MAKE) -C "pico_ada_c02_button_and_led"	$(@)
	$(MAKE) -C "pico_ada_c03_led_bar"		$(@)
	$(MAKE) -C "pico_ada_c04_pwm"			$(@)
	$(MAKE) -C "pico2_ada_c01_blink_lt"		$(@)
	$(MAKE) -C "pico2_ada_c02_button_and_led"	$(@)
	$(MAKE) -C "pico2_ada_c03_led_bar"		$(@)
	$(MAKE) -C "pico2_ada_c04_pwm"			$(@)

development:
	$(MAKE) -C "pico_xbsp"				$(@)
	$(MAKE) -C "pico_ada_c01_blink"			$(@)
	$(MAKE) -C "pico_ada_c01_blink_lt"		$(@)
	$(MAKE) -C "pico_ada_c02_button_and_led"	$(@)
	$(MAKE) -C "pico_ada_c03_led_bar"		$(@)
	$(MAKE) -C "pico_ada_c04_pwm"			$(@)
	$(MAKE) -C "pico2_ada_c01_blink_lt"		$(@)
	$(MAKE) -C "pico2_ada_c02_button_and_led"	$(@)
	$(MAKE) -C "pico2_ada_c03_led_bar"		$(@)
	$(MAKE) -C "pico2_ada_c04_pwm"			$(@)

release:
	$(MAKE) -C "pico_xbsp"				$(@)
	$(MAKE) -C "pico_ada_c01_blink"			$(@)
	$(MAKE) -C "pico_ada_c01_blink_lt"		$(@)
	$(MAKE) -C "pico_ada_c02_button_and_led"	$(@)
	$(MAKE) -C "pico_ada_c03_led_bar"		$(@)
	$(MAKE) -C "pico_ada_c04_pwm"			$(@)
	$(MAKE) -C "pico2_ada_c01_blink_lt"		$(@)
	$(MAKE) -C "pico2_ada_c02_button_and_led"	$(@)
	$(MAKE) -C "pico2_ada_c03_led_bar"		$(@)
	$(MAKE) -C "pico2_ada_c04_pwm"			$(@)

validation:
	$(MAKE) -C "pico_xbsp"				$(@)
	$(MAKE) -C "pico_ada_c01_blink"			$(@)
	$(MAKE) -C "pico_ada_c01_blink_lt"		$(@)
	$(MAKE) -C "pico_ada_c02_button_and_led"	$(@)
	$(MAKE) -C "pico_ada_c03_led_bar"		$(@)
	$(MAKE) -C "pico_ada_c04_pwm"			$(@)
	$(MAKE) -C "pico2_ada_c01_blink_lt"		$(@)
	$(MAKE) -C "pico2_ada_c02_button_and_led"	$(@)
	$(MAKE) -C "pico2_ada_c03_led_bar"		$(@)
	$(MAKE) -C "pico2_ada_c04_pwm"			$(@)

pretty:
	-$(MAKE) -C "pico_xbsp"				$(@)
	-${MAKE} -C "pico_ada_c01_blink"		$(@)
	-${MAKE} -C "pico_ada_c01_blink_lt"		$(@)
	-${MAKE} -C "pico_ada_c02_button_and_led"	$(@)
	-${MAKE} -C "pico_ada_c03_led_bar"		$(@)
	-$(MAKE) -C "pico_ada_c04_pwm"			$(@)
	-$(MAKE) -C "pico2_ada_c01_blink_lt"		$(@)
	-$(MAKE) -C "pico2_ada_c02_button_and_led"	$(@)
	-$(MAKE) -C "pico2_ada_c03_led_bar"		$(@)
	-$(MAKE) -C "pico2_ada_c04_pwm"			$(@)

doc:
	$(MAKE) -C "pico_ada_doc"			$(@)
	$(MAKE) -C "pico2_ada_doc"			$(@)

clean:
	$(MAKE) -C "pico_xbsp"				$(@)
	$(MAKE) -C "pico_ada_doc"			$(@)
	$(MAKE) -C "pico_xbsp"				$(@)
	${MAKE} -C "pico_ada_c01_blink"			$(@)
	${MAKE} -C "pico_ada_c01_blink_lt"		$(@)
	${MAKE} -C "pico_ada_c02_button_and_led"	$(@)
	${MAKE} -C "pico_ada_c03_led_bar"		$(@)
	$(MAKE) -C "pico_ada_c04_pwm"			$(@)
	$(MAKE) -C "pico2_ada_doc"			$(@)
	$(MAKE) -C "pico2_ada_c01_blink_lt"		$(@)
	$(MAKE) -C "pico2_ada_c02_button_and_led"	$(@)
	$(MAKE) -C "pico2_ada_c03_led_bar"		$(@)
	$(MAKE) -C "pico2_ada_c04_pwm"			$(@)

update:
	alr index --update-all
	$(MAKE) -C "pico_xbsp"				$(@)
	$(MAKE) -C "pico_ada_doc"			$(@)
	${MAKE} -C "pico_ada_c01_blink"			$(@)
	${MAKE} -C "pico_ada_c01_blink_lt"		$(@)
	${MAKE} -C "pico_ada_c02_button_and_led"	$(@)
	${MAKE} -C "pico_ada_c03_led_bar"		$(@)
	$(MAKE) -C "pico_ada_c04_pwm"			$(@)
	$(MAKE) -C "pico2_ada_doc"			$(@)
	$(MAKE) -C "pico2_ada_c02_button_and_led"	$(@)
	$(MAKE) -C "pico2_ada_c03_led_bar"		$(@)
	$(MAKE) -C "pico2_ada_c04_pwm"			$(@)

############################################################# {{{1 ##########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=8 noexpandtab :
# vim: set textwidth=0 filetype=make foldmethod=marker :
# vim: set spell spelllang=en_gb :
