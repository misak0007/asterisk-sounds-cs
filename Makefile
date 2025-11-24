#
# Copyright (C) 2025 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=asterisk-sound-cs
PKG_VERSION:=0.1.1
PKG_RELEASE:=1
PKG_BUILD_PARALLEL:=0

PKG_BUILD_DIR:=$(BUILD_DIR)/asterisk-sound-cs-$(PKG_VERSION)

PKG_LICENSE:=GPL-3.0
PKG_LICENSE_FILES:=COPYING LICENSE
PKG_MAINTAINER:=Michael Gruz <michael.gruz@gmail.com>

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/download.mk

define Package/asterisk-sound-cs/Default
  SUBMENU:=Telephony
  SECTION:=net
  CATEGORY:=Network
endef

define Download/asterisk-sound
  URL:=https://github.com/misak0007/asterisk-core-sounds-cs/releases/download/v$(PKG_VERSION)
  FILE:=$(2).tar.gz
  URL_FILE:$(2).tar.gz
  HASH:=$(3)
  SUBDIR:=$(PKG_SOURCE_SUBDIR)
endef

ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-alaw-ladislav)$(CONFIG_PACKAGE_asterisk-core-voicemail-cs-alaw-ladislav),)
$(eval $(call Download,asterisk-sound,asterisk-core-sounds-cs-alaw-ladislav-v$(PKG_VERSION),a1de85c7a67c493aad4c3f4971a20b6849d5dab5305d374b968ac38ea3e6cc8c))
endif
ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-g722-ladislav)$(CONFIG_PACKAGE_asterisk-core-voicemail-cs-g722-ladislav),)
$(eval $(call Download,asterisk-sound,asterisk-core-sounds-cs-g722-ladislav-v$(PKG_VERSION),ee5dc668f781af06735505bc686d39a363da8fc18f944619c6b3a4f3958f92df))
endif
ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-g729-ladislav)$(CONFIG_PACKAGE_asterisk-core-voicemail-cs-g729-ladislav),)
$(eval $(call Download,asterisk-sound,asterisk-core-sounds-cs-g729-ladislav-v$(PKG_VERSION),359f51c5d4d4a8d0b2232d542b17119a49c2cedfb7d7c2b087a50cdd96a9ebd0))
endif
ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-gsm-ladislav)$(CONFIG_PACKAGE_asterisk-core-voicemail-cs-gsm-ladislav),)
$(eval $(call Download,asterisk-sound,asterisk-core-sounds-cs-gsm-ladislav-v$(PKG_VERSION),ae76a00dbe289adb5cba37bbb3ae0db17620e815330a1d10f71a278883ccb064))
endif
ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-opus-ladislav)$(CONFIG_PACKAGE_asterisk-core-voicemail-cs-opus-ladislav),)
$(eval $(call Download,asterisk-sound,asterisk-core-sounds-cs-opus-ladislav-v$(PKG_VERSION),fe50da635368cf516a3f32013831cacc03b574c5e59c7d330495fca0d7ef66c0))
endif
ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-sln16-ladislav)$(CONFIG_PACKAGE_asterisk-core-voicemail-cs-sln16-ladislav),)
$(eval $(call Download,asterisk-sound,asterisk-core-sounds-cs-sln16-ladislav-v$(PKG_VERSION),bebe3dbc5afb133ed2c7b297d868f01efc74fd5cca621fe9efa5ba683c4eee9f))
endif
ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-ulaw-ladislav)$(CONFIG_PACKAGE_asterisk-core-voicemail-cs-ulaw-ladislav),)
$(eval $(call Download,asterisk-sound,asterisk-core-sounds-cs-ulaw-ladislav-v$(PKG_VERSION),8e323cbdb99315e8aeacb976cca7f7de5145ced43c18b8bd906f24a5621d5d2d))
endif
ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-wav-ladislav)$(CONFIG_PACKAGE_asterisk-core-voicemail-cs-wav-ladislav),)
$(eval $(call Download,asterisk-sound,asterisk-core-sounds-cs-wav-ladislav-v$(PKG_VERSION),c144fc18a1dffb3c029c74a2b1567ec98868c68382280e84b89f0ce81a01d671))
endif
ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-siren7-ladislav)$(CONFIG_PACKAGE_asterisk-core-voicemail-cs-siren7-ladislav),)
$(eval $(call Download,asterisk-sound,asterisk-core-sounds-cs-siren7-ladislav-v$(PKG_VERSION),133b9831103224bebdef04eb46192c09ddb30637358c9419849c90567968a902))
endif
ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-siren14-ladislav)$(CONFIG_PACKAGE_asterisk-core-voicemail-cs-siren14-ladislav),)
$(eval $(call Download,asterisk-sound,asterisk-core-sounds-cs-siren14-ladislav-v$(PKG_VERSION),bc0a8b44bc96de1d279bd2642bb397ea1e866c753f18064217962600a78301d8))
endif

define Build/Prepare
	$(INSTALL_DIR) $(PKG_BUILD_DIR)/core-cs
ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-alaw-ladislav)$(CONFIG_PACKAGE_asterisk-core-sound-voicemail-cs-alaw-ladislav),)
	$(HOST_TAR) -C $(PKG_BUILD_DIR)/core-cs -xzf $(DL_DIR)/asterisk-core-sounds-cs-alaw-ladislav-v$(PKG_VERSION).tar.gz
endif
ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-g722-ladislav)$(CONFIG_PACKAGE_asterisk-core-sound-voicemail-cs-g722-ladislav),)
	$(HOST_TAR) -C $(PKG_BUILD_DIR)/core-cs -xzf $(DL_DIR)/asterisk-core-sounds-cs-g722-ladislav-v$(PKG_VERSION).tar.gz
endif
ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-g729-ladislav)$(CONFIG_PACKAGE_asterisk-core-sound-voicemail-cs-g729-ladislav),)
	$(HOST_TAR) -C $(PKG_BUILD_DIR)/core-cs -xzf $(DL_DIR)/asterisk-core-sounds-cs-g729-ladislav-v$(PKG_VERSION).tar.gz
endif
ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-gsm-ladislav)$(CONFIG_PACKAGE_asterisk-core-sound-voicemail-cs-gsm-ladislav),)
	$(HOST_TAR) -C $(PKG_BUILD_DIR)/core-cs -xzf $(DL_DIR)/asterisk-core-sounds-cs-gsm-ladislav-v$(PKG_VERSION).tar.gz
endif
ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-opus-ladislav)$(CONFIG_PACKAGE_asterisk-core-sound-voicemail-cs-opus-ladislav),)
	$(HOST_TAR) -C $(PKG_BUILD_DIR)/core-cs -xzf $(DL_DIR)/asterisk-core-sounds-cs-opus-ladislav-v$(PKG_VERSION).tar.gz
endif
ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-sln16-ladislav)$(CONFIG_PACKAGE_asterisk-core-sound-voicemail-cs-sln16-ladislav),)
	$(HOST_TAR) -C $(PKG_BUILD_DIR)/core-cs -xzf $(DL_DIR)/asterisk-core-sounds-cs-sln16-ladislav-v$(PKG_VERSION).tar.gz
endif
ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-ulaw-ladislav)$(CONFIG_PACKAGE_asterisk-core-sound-voicemail-cs-ulaw-ladislav),)
	$(HOST_TAR) -C $(PKG_BUILD_DIR)/core-cs -xzf $(DL_DIR)/asterisk-core-sounds-cs-ulaw-ladislav-v$(PKG_VERSION).tar.gz
endif
ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-wav-ladislav)$(CONFIG_PACKAGE_asterisk-core-sound-voicemail-cs-wav-ladislav),)
	$(HOST_TAR) -C $(PKG_BUILD_DIR)/core-cs -xzf $(DL_DIR)/asterisk-core-sounds-cs-wav-ladislav-v$(PKG_VERSION).tar.gz
endif
ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-siren7-ladislav)$(CONFIG_PACKAGE_asterisk-core-sound-voicemail-cs-siren7-ladislav),)
	$(HOST_TAR) -C $(PKG_BUILD_DIR)/core-cs -xzf $(DL_DIR)/asterisk-core-sounds-cs-siren7-ladislav-v$(PKG_VERSION).tar.gz
endif
ifneq ($(CONFIG_PACKAGE_asterisk-core-sound-cs-siren14-ladislav)$(CONFIG_PACKAGE_asterisk-core-sound-voicemail-cs-siren14-ladislav),)
	$(HOST_TAR) -C $(PKG_BUILD_DIR)/core-cs -xzf $(DL_DIR)/asterisk-core-sounds-cs-siren14-ladislav-v$(PKG_VERSION).tar.gz
endif
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/asterisk/install/sounds
	$(INSTALL_DIR) $(1)/usr/share/asterisk/sounds/
	$(INSTALL_DIR) $(1)/usr/share/asterisk/sounds/dictate
	$(INSTALL_DIR) $(1)/usr/share/asterisk/sounds/digits
	$(INSTALL_DIR) $(1)/usr/share/asterisk/sounds/followme
	$(INSTALL_DIR) $(1)/usr/share/asterisk/sounds/letters
	$(INSTALL_DIR) $(1)/usr/share/asterisk/sounds/phonetic
	$(INSTALL_DIR) $(1)/usr/share/asterisk/sounds/silence
	$(CP) $(PKG_BUILD_DIR)/core-cs/dictate/*.$(2) $(1)/usr/share/asterisk/sounds/dictate
	$(CP) $(PKG_BUILD_DIR)/core-cs/digits/*.$(2) $(1)/usr/share/asterisk/sounds/digits
	$(CP) $(PKG_BUILD_DIR)/core-cs/followme/*.$(2) $(1)/usr/share/asterisk/sounds/followme
	$(CP) $(PKG_BUILD_DIR)/core-cs/letters/*.$(2) $(1)/usr/share/asterisk/sounds/letters
	$(CP) $(PKG_BUILD_DIR)/core-cs/phonetic/*.$(2) $(1)/usr/share/asterisk/sounds/phonetic
	$(CP) $(PKG_BUILD_DIR)/core-cs/silence/*.$(2) $(1)/usr/share/asterisk/sounds/silence
	$(CP) $(PKG_BUILD_DIR)/core-cs/*.$(2) $(1)/usr/share/asterisk/sounds/
	rm -f $(1)/usr/share/asterisk/sounds/vm-*
endef

define Package/asterisk/install/voicemail
	$(INSTALL_DIR) $(1)/usr/share/asterisk/sounds/
	$(CP) $(PKG_BUILD_DIR)/core-cs/vm-*.$(2) $(1)/usr/share/asterisk/sounds/
endef

define BuildasteriskCoreSound
  define Package/asterisk-core-sound-cs-$(1)-$(3)
  $$(call Package/asterisk-sound-cs/Default)
    TITLE:=Sound support
    DEPENDS:=asterisk
  endef

  define Package/asterisk-core-sound-cs-$(1)-$(3)/description
$(2)
  endef

  define Package/asterisk-core-sound-cs-$(1)-$(3)/install
$(call Package/asterisk/install/sounds,$$(1),$(1))
  endef

  $$(eval $$(call BuildPackage,asterisk-core-sound-cs-$(1)-$(3)))
endef

define BuildasteriskCoreSoundVoicemail
  define Package/asterisk-core-sound-voicemail-cs-$(1)-$(3)
  $$(call Package/asterisk-sound-cs/Default)
    TITLE:=Sound support
    DEPENDS:=asterisk
  endef

  define Package/asterisk-core-sound-voicemail-cs-$(1)-$(3)/description
$(2)
  endef

  define Package/asterisk-core-sound-voicemail-cs-$(1)-$(3)/install
$(call Package/asterisk/install/voicemail,$$(1),$(1))
  endef

  $$(eval $$(call BuildPackage,asterisk-core-sound-voicemail-cs-$(1)-$(3)))
endef

$(eval $(call BuildasteriskCoreSound,alaw,Csech core sound Files. alaw format,ladislav))
$(eval $(call BuildasteriskCoreSoundVoicemail,alaw,Csech core sound voicemail Files. alaw format,ladislav))
$(eval $(call BuildasteriskCoreSound,g722,Csech core sound Files. g722 format,ladislav))
$(eval $(call BuildasteriskCoreSoundVoicemail,g722,Csech core sound voicemail Files. g722 format,ladislav))
$(eval $(call BuildasteriskCoreSound,g729,Csech core sound Files. g729 format,ladislav))
$(eval $(call BuildasteriskCoreSoundVoicemail,g729,Csech core sound voicemail Files. g729 format,ladislav))
$(eval $(call BuildasteriskCoreSound,gsm,Csech core sound Files. gsm format,ladislav))
$(eval $(call BuildasteriskCoreSoundVoicemail,gsm,Csech core sound voicemail Files. gsm format,ladislav))
$(eval $(call BuildasteriskCoreSound,opus,Csech core sound Files. opus format,ladislav))
$(eval $(call BuildasteriskCoreSoundVoicemail,opus,Csech core sound voicemail Files. opus format,ladislav))
$(eval $(call BuildasteriskCoreSound,sln16,Csech core sound Files. sln16 format,ladislav))
$(eval $(call BuildasteriskCoreSoundVoicemail,sln16,Csech core sound voicemail Files. sln16 format,ladislav))
$(eval $(call BuildasteriskCoreSound,ulaw,Csech core sound Files. ulaw format,ladislav))
$(eval $(call BuildasteriskCoreSoundVoicemail,ulaw,Csech core sound voicemail Files. ulaw format,ladislav))
$(eval $(call BuildasteriskCoreSound,wav,Csech core sound Files. wav format,ladislav))
$(eval $(call BuildasteriskCoreSoundVoicemail,wav,Csech core sound voicemail Files. wav format,ladislav))
$(eval $(call BuildasteriskCoreSound,siren7,Csech core sound Files. siren7 format,ladislav))
$(eval $(call BuildasteriskCoreSoundVoicemail,siren7,Csech core sound voicemail Files. siren7 format,ladislav))
$(eval $(call BuildasteriskCoreSound,siren14,Csech core sound Files. siren14 format,ladislav))
$(eval $(call BuildasteriskCoreSoundVoicemail,siren14,Csech core sound voicemail Files. siren14 format,ladislav))
