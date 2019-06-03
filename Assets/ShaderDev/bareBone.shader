// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "ShaderDev/bareBone"
{
	Properties
	{
		_Color("Main Color", Color) = (1,1,1,1)//(R,G,B,A)
	}

		Subshader
	{
		Pass
		{
			CGPROGRAM		//To tell that the CG(Control over graphics)language starts here.

			#pragma vertex vert		//declaration of a function of type vertex
			#pragma fragment frag	//declaration of a function of type fragment

			uniform half4 _Color;	//"uniform" is a keyword to define global variables

			struct vertexInput		//Input vertex
			{
				float4 vertex: POSITION;	//position of input vertex
			};

			struct vertexOutput		//output vertex
			{
				float4 pos: SV_POSITION;	//position of output vertex
			};
			
			vertexOutput vert(vertexInput v)	//vertex function which returns the output of type vertexOutput
			{
				vertexOutput o;
				o.pos = UnityObjectToClipPos(v.vertex);
				return o;
			}

			half4 frag(vertexOutput i):COLOR	//fragment function which takes vertexOutput as an input and returns color
			{
				return _Color;		//takes the color provided in properties and colors the mesh with that color
			}

			ENDCG	//To tell that the CG(Control over graphics)language ends here.
		}
	}








}
