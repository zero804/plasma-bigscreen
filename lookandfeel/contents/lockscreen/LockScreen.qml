/********************************************************************
 This file is part of the KDE project.

Copyright (C) 2014 Aleix Pol Gonzalez <aleixpol@blue-systems.com>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*********************************************************************/

import QtQuick 2.0
import QtQuick.Controls 1.1
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.private.sessions 2.0
import "../components"

Image {
    id: root
    property int interfaceVersion: org_kde_plasma_screenlocker_greeter_interfaceVersion ? org_kde_plasma_screenlocker_greeter_interfaceVersion : 0

    source: backgroundPath
    fillMode: Image.PreserveAspectCrop
    asynchronous: true
    function unlock() {
        authenticator.tryUnlock("mycroft")
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onPositionChanged: root.unlock()
        onClicked: root.unlock()
    }
    Keys.onPressed: root.unlock()
}
