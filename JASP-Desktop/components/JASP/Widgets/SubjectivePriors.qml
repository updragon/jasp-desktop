//
// Copyright (C) 2013-2018 University of Amsterdam
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public
// License along with this program.  If not, see
// <http://www.gnu.org/licenses/>.
//


import QtQuick 2.8
import QtQuick.Layouts 1.3
import JASP.Controls 1.0


ExpanderButton {
    text: qsTr("Prior")

    RadioButtonGroup {
        name: "effectSize"
        RadioButton {text: qsTr("Standardized effect size"); name: "standardized"; checked: true; debug: true; id: standardized}
        RadioButtonGroup {
            Layout.leftMargin: DEBUG_MODE ? 25 : 0
            enabled: standardized.checked
            name: "effectSizeStandardized"
            RadioButton {text: qsTr("Default"); name: "default"; checked: true; id: defaultEffect}
            RadioButtonGroup {
                Layout.leftMargin: 25
                enabled: defaultEffect.checked
                name: "defaultStandardizedEffectSize"
                Row {
                    RadioButton {text: qsTr("Cauchy"); name: "cauchy"; checked: true}
                    DoubleField { text: qsTr("scale"); name: "priorWidth"; defaultValue: 0.707; fieldWidth: 50; doubleValidator { top: 2 }}
                }
            }

            RadioButton {text: qsTr("Informed"); name: "informative"; id: informative}
            RadioButtonGroup {
                enabled: informative.checked
                Layout.leftMargin: 25
                name: "informativeStandardizedEffectSize"
                Row {
                    spacing: 10
                    RadioButton { text: qsTr("Cauchy")  ; name: "cauchy"; checked: true; id: cauchyInformative}
                    DoubleField { text: qsTr("location:"); name: "informativeCauchyLocation"; visible: cauchyInformative.checked; defaultValue: 0; doubleValidator {bottom: -3; top: -3}}
                    DoubleField { text: qsTr("scale:"); name: "informativeCauchyScale"; visible: cauchyInformative.checked; defaultValue: 0.707; fieldWidth: 50; doubleValidator {top: 2}}
                }
                Row {
                    spacing: 10
                    RadioButton { text: qsTr("Normal")  ; name: "normal"; id: normalInformative}
                    DoubleField { text: qsTr("mean:"); name: "informativeNormalMean"; visible: normalInformative.checked; defaultValue: 0; doubleValidator {bottom: -3; top: -3}}
                    DoubleField { text: qsTr("std:"); name: "informativeNormalStd"; visible: normalInformative.checked; defaultValue: 0.707; fieldWidth: 50; doubleValidator {top: 2}}
                }
                Row {
                    spacing: 10
                    RadioButton { text: qsTr("t")       ; name: "t"; id: tInformative}
                    DoubleField { text: qsTr("location:"); name: "informativeTLocation"; visible: tInformative.checked; defaultValue: 0; doubleValidator {bottom: -3; top: -3}}
                    DoubleField { text: qsTr("scale:"); name: "informativeTScale"; visible: tInformative.checked; defaultValue: 0.707; fieldWidth: 50; doubleValidator {bottom: 0.001; top: 2}}
                    DoubleField { text: qsTr("df:"); name: "informativeTDf"; visible: tInformative.checked; inputType: "number"; value: "1"; doubleValidator {bottom: 1; top: 100}}
                }
            }
        }

        RadioButton {text: qsTr("Raw effect size (Dienes)"); name: "dienes"; debug: true; id: dienes}
        RadioButtonGroup {
            enabled: dienes.checked
            Layout.leftMargin: 25
            debug: true
            name: "dienesEffectSize"
            Row {
                spacing: 10
                RadioButton { text: qsTr("Uniform"); name: "uniform"; checked: true; id: uniformDienes}
                DoubleField { text: qsTr("lower bound:"); name: "uniformDienesLowerBound"; visible: uniformDienes.checked; defaultValue: 0.707; fieldWidth: 50; doubleValidator {bottom: 0; top: 2}}
                DoubleField { text: qsTr("upper bound:"); name: "uniformDienesUpperBound"; visible: uniformDienes.checked; defaultValue: 0.707; fieldWidth: 50; doubleValidator {bottom: 0; top: 2}}
            }
            Row {
                spacing: 10
                RadioButton { text: qsTr("Half-normal"); name: "half_normal"; id: halfNormalDienes}
                DoubleField { text: qsTr("std:"); name: "halfNormalDienesStd"; visible: halfNormalDienes.checked; defaultValue: 0.707; fieldWidth: 50; doubleValidator {bottom: 0; top: 2}}
            }
            Row {
                spacing: 10
                RadioButton { text: qsTr("Normal"); name: "normal"; id: normalDienes}
                DoubleField { text: qsTr("mean:"); name: "normalDienesMean"; visible: normalDienes.checked; defaultValue: 0.707; fieldWidth: 50; doubleValidator {bottom: 0; top: 2}}
                DoubleField { text: qsTr("std:"); name: "normalDienesStd"; visible: normalDienes.checked; defaultValue: 0.707; fieldWidth: 50; doubleValidator {bottom: 0; top: 2}}
            }
        }
    }

}
