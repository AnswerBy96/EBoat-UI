import QtQuick 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0
import QtQuick3D 1.15
import QtQml.Models 2.1


View3D{
        id:view3D
        anchors.fill: parent
        camera: camera
        environment: sceneEnvironment

        SceneEnvironment
        {
            id:sceneEnvironment
            antialiasingQuality: SceneEnvironment.High
            antialiasingMode: SceneEnvironment.MSAA
            backgroundMode: SceneEnvironment.Transparent
            clearColor: "transparent"
        }

        function boatAnimation(swtichbtnstate)
        {
            if(swtichbtnstate === 0)
            {
                startanimation.running = true;
                endanimation.running = false;
            }
            else
            {
                endanimation.running = true;
                startanimation.running = false
            }
        }

        Node {
            id: rootNode
            Node {
                id: cameraNode
                PerspectiveCamera {
                    id: camera
                    z: 85
                    }
            }
            Node{
                DirectionalLight {
                    id: directionalLight
                    brightness: 100
                }
            }
            Node {
                id: group
                Model {
                    id: pasted__pSphere1
                    x: -3.34505e-09
                    y: 8.12014
                    z: -0.856611
                    eulerRotation.x: 0.781237
                    scale.x: 0.12078
                    scale.y: 0.12078
                    scale.z: 0.12078
                    source: "meshes/pasted__pSphere1.mesh"

                    DefaultMaterial {
                        id: grigio_scuro_material
                        diffuseColor: "#ff484848"
                    }
                    materials: [
                        grigio_scuro_material
                    ]

                    Model {
                        id: pasted__pCylinder1
                        x: 2.84727e-08
                        y: -2.09197
                        scale.x: 0.83254
                        scale.y: 1.33916
                        scale.z: 0.83254
                        source: "meshes/pasted__pCylinder1.mesh"
                        materials: [
                            grigio_scuro_material
                        ]
                    }
                }

                Model {
                    id: pasted__pCylinder2
                    x: 0.915835
                    y: 7.51807
                    z: 5.2423
                    eulerRotation.x: 4.25358
                    scale.x: 0.206599
                    scale.y: 0.206599
                    scale.z: 0.206599
                    source: "meshes/pasted__pCylinder2.mesh"

                    DefaultMaterial {
                        id: vtr_material
                        diffuseColor: "#ffcccccc"
                    }
                    materials: [
                        vtr_material
                    ]
                }

                Model {
                    id: pasted__pCylinder3
                    x: 1.59595
                    y: 7.48199
                    z: 5.17154
                    scale.x: 0.117812
                    scale.y: 0.117812
                    scale.z: 0.186658
                    source: "meshes/pasted__pCylinder3.mesh"

                    DefaultMaterial {
                        id: inox_material
                        diffuseColor: "#ff999999"
                    }
                    materials: [
                        inox_material
                    ]
                }
            }

            Node
            {
                id: body_model
                eulerRotation.x: 90
                eulerRotation.y: 0
                eulerRotation.z: 0
                Model {
                    id: nurbsToPoly51
                    source: "meshes/nurbsToPoly51.mesh"
                    materials: [
                        grigio_scuro_material
                    ]
                }

                Model {
                    id: nurbsToPoly56
                    source: "meshes/nurbsToPoly56.mesh"

                    DefaultMaterial {
                        id: teak_material
                        diffuseColor: "#fefbfb"
                    }
                    materials: [
                        teak_material
                    ]
                }

                Model {
                    id: nurbsToPoly61
                    source: "meshes/nurbsToPoly61.mesh"
                    materials: [
                        grigio_scuro_material
                    ]
                }

                Model {
                    id: nurbsToPoly62
                    source: "meshes/nurbsToPoly62.mesh"
                    materials: [
                        inox_material
                    ]
                }

                Model {
                    id: nurbsToPoly63
                    source: "meshes/nurbsToPoly63.mesh"

                    DefaultMaterial {
                        id: lucina_material
                        diffuseColor: "#ffcccccc"
                        opacity: 0.846154
                    }
                    materials: [
                        lucina_material
                    ]
                }

                Model {
                    id: nurbsToPoly70
                    source: "meshes/nurbsToPoly70.mesh"

                    DefaultMaterial {
                        id: vetri_material
                        diffuseColor: "#ff0c1a34"
                        opacity: 0.620482
                    }
                    materials: [
                        vetri_material
                    ]
                }

                Model {
                    id: nurbsToPoly71
                    source: "meshes/nurbsToPoly71.mesh"
                    materials: [
                        vetri_material
                    ]
                }

                Model {
                    id: nurbsToPoly72
                    source: "meshes/nurbsToPoly72.mesh"
                    materials: [
                        vetri_material
                    ]
                }

                Model {
                    id: nurbsToPoly73
                    source: "meshes/nurbsToPoly73.mesh"
                    materials: [
                        vetri_material
                    ]
                }

                Model {
                    id: polySurface3
                    source: "meshes/polySurface3.mesh"

                    DefaultMaterial {
                        id: lambert1_material
                        diffuseColor: "#ff666666"
                    }
                    materials: [
                        lambert1_material,
                        grigio_scuro_material
                    ]
                }

                Model {
                    id: nurbsToPoly91
                    source: "meshes/nurbsToPoly91.mesh"
                    materials: [
                        vetri_material
                    ]
                }

                Model {
                    id: nurbsToPoly92
                    source: "meshes/nurbsToPoly92.mesh"

                    DefaultMaterial {
                        id: nero_material
                        diffuseColor: "#ff0b0b0b"
                    }
                    materials: [
                        nero_material
                    ]
                }

                Model {
                    id: nurbsToPoly93
                    source: "meshes/nurbsToPoly93.mesh"
                    materials: [
                        nero_material
                    ]
                }

                Model {
                    id: nurbsToPoly94
                    source: "meshes/nurbsToPoly94.mesh"
                    materials: [
                        vetri_material
                    ]
                }

                Model {
                    id: nurbsToPoly96
                    source: "meshes/nurbsToPoly96.mesh"

                    DefaultMaterial {
                        id: vtr_cab_material
                        diffuseColor: "#ff525252"
                    }
                    materials: [
                        vtr_cab_material
                    ]
                }

                Node {
                    id: nurbsToPoly128

                    Model {
                        id: polySurface42
                        source: "meshes/polySurface42.mesh"
                        materials: [
                            vtr_material
                        ]
                    }
                }

                Model {
                    id: polySurface65
                    source: "meshes/polySurface65.mesh"
                    materials: [
                        vtr_material
                    ]
                }

                Model {
                    id: nurbsToPoly130
                    source: "meshes/nurbsToPoly130.mesh"
                    materials: [
                        teak_material
                    ]
                }

                Model {
                    id: nurbsToPoly131
                    source: "meshes/nurbsToPoly131.mesh"
                    materials: [
                        vetri_material
                    ]
                }

                Model {
                    id: nurbsToPoly132
                    source: "meshes/nurbsToPoly132.mesh"

                    DefaultMaterial {
                        id: pasted__blinn2_material
                        diffuseColor: "#fefbfb"
                    }
                    materials: [
                        pasted__blinn2_material
                    ]
                }

                Model {
                    id: nurbsToPoly133
                    source: "meshes/nurbsToPoly133.mesh"

                    DefaultMaterial {
                        id: chiglia_material
                        diffuseColor: "#ff1c1c1c"
                    }
                    materials: [
                        chiglia_material
                    ]
                }

                Model {
                    id: nurbsToPoly134
                    source: "meshes/nurbsToPoly134.mesh"
                    materials: [
                        pasted__blinn2_material
                    ]
                }

                Model {
                    id: nurbsToPoly135
                    source: "meshes/nurbsToPoly135.mesh"
                    materials: [
                        pasted__blinn2_material
                    ]
                }

                Model {
                    id: nurbsToPoly139
                    source: "meshes/nurbsToPoly139.mesh"

                    DefaultMaterial {
                        id: mogano_material
                        diffuseColor: "#fefbfb"
                    }
                    materials: [
                        mogano_material
                    ]
                }

                Model {
                    id: nurbsToPoly150
                    source: "meshes/nurbsToPoly150.mesh"
                    materials: [
                        inox_material
                    ]
                }

                Model {
                    id: nurbsToPoly151
                    source: "meshes/nurbsToPoly151.mesh"
                    materials: [
                        inox_material
                    ]
                }

                Model {
                    id: nurbsToPoly160
                    source: "meshes/nurbsToPoly160.mesh"
                    materials: [
                        inox_material
                    ]
                }

                Model {
                    id: nurbsToPoly163
                    source: "meshes/nurbsToPoly163.mesh"
                    materials: [
                        vetri_material
                    ]
                }

                Model {
                    id: nurbsToPoly164
                    source: "meshes/nurbsToPoly164.mesh"

                    DefaultMaterial {
                        id: striscia_material
                        diffuseColor: "#ff666666"
                    }
                    materials: [
                        striscia_material
                    ]
                }

                Model {
                    id: nurbsToPoly165
                    source: "meshes/nurbsToPoly165.mesh"
                    materials: [
                        chiglia_material
                    ]
                }

                Model {
                    id: nurbsToPoly166
                    source: "meshes/nurbsToPoly166.mesh"
                    materials: [
                        pasted__blinn2_material
                    ]
                }

                Model {
                    id: nurbsToPoly167
                    source: "meshes/nurbsToPoly167.mesh"
                    materials: [
                        pasted__blinn2_material
                    ]
                }

                Model {
                    id: nurbsToPoly168
                    source: "meshes/nurbsToPoly168.mesh"
                    materials: [
                        chiglia_material
                    ]
                }

                Model {
                    id: nurbsToPoly169
                    source: "meshes/nurbsToPoly169.mesh"
                    materials: [
                        mogano_material
                    ]
                }

                Model {
                    id: nurbsToPoly170
                    source: "meshes/nurbsToPoly170.mesh"
                    materials: [
                        chiglia_material
                    ]
                }

                Model {
                    id: nurbsToPoly174
                    source: "meshes/nurbsToPoly174.mesh"
                    materials: [
                        teak_material
                    ]
                }

                Model {
                    id: nurbsToPoly175
                    source: "meshes/nurbsToPoly175.mesh"
                    materials: [
                        pasted__blinn2_material
                    ]
                }

                Model {
                    id: nurbsToPoly176
                    source: "meshes/nurbsToPoly176.mesh"
                    materials: [
                        pasted__blinn2_material
                    ]
                }

                Model {
                    id: nurbsToPoly182
                    source: "meshes/nurbsToPoly182.mesh"
                    materials: [
                        pasted__blinn2_material
                    ]
                }



                Model {
                    id: nurbsToPoly183
                    source: "meshes/nurbsToPoly183.mesh"
                    materials: [
                        inox_material
                    ]
                }

                Model {
                    id: nurbsToPoly185
                    source: "meshes/nurbsToPoly185.mesh"
                    materials: [
                        inox_material
                    ]
                }

                Model {
                    id: nurbsToPoly189
                    source: "meshes/nurbsToPoly189.mesh"
                    materials: [
                        inox_material
                    ]
                }

                Model {
                    id: nurbsToPoly1755
                    source: "meshes/nurbsToPoly1755.mesh"
                    materials: [
                        nero_material,
                        inox_material
                    ]
                }
            }

            NumberAnimation {
                id: startanimation
                target: body_model
                property: "eulerRotation.x"
                running: false
                duration: 1500
                to: 30
                from: 90
            }

            NumberAnimation {
                id: endanimation
                target: body_model
                property: "eulerRotation.x"
                running: false
                duration: 1500
                to: 90
                from: 30
            }
        }

}

//小黄船模型
//     Node {
//             id: node
//             DirectionalLight {
//                  eulerRotation: Qt.vector3d(0, 0, 90)
//                 id: directionalLight
//             }
//         Model {
//             id: cubeModel
//             eulerRotation.x: 0
//             eulerRotation.y: 90
//             eulerRotation.z: 90

//             source: "meshes/boat.mesh"

//             DefaultMaterial {
//                 id: material_010_material
//                 diffuseColor: "#ff323232"
//             }

//             DefaultMaterial {
//                 id: material_002_material
//                 diffuseColor: "#ffc9af01"
//             }

//             DefaultMaterial {
//                 id: material_001_material
//                 diffuseColor: "#ffc9af01"
//             }

//             DefaultMaterial {
//                 id: material_003_material
//                 diffuseColor: "#ff272929"
//             }

//             DefaultMaterial {
//                 id: material_004_material
//                 diffuseColor: "#ff191919"
//             }

//             DefaultMaterial {
//                 id: material_005_material
//                 diffuseColor: "#ff020101"
//             }

//             DefaultMaterial {
//                 id: material_006_material
//                 diffuseColor: "#ffcc0202"
//             }

//             DefaultMaterial {
//                 id: material_009_material
//                 diffuseColor: "#ff121212"
//             }

//             DefaultMaterial {
//                 id: material_007_material
//                 diffuseColor: "#ff000000"
//             }
//             materials: [material_010_material, material_002_material, material_001_material, material_003_material, material_004_material, material_005_material, material_006_material, material_009_material, material_007_material]
//         }
//     }
// }
