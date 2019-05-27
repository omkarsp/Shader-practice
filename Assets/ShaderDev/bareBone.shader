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

			#pragma vertex vert
			#pragma fragment frag

			uniform half4 _Color;

			struct vertexInput
			{
				float4 vertex: POSITION;
			};

			struct vertexOutput
			{
				float4 pos: SV_POSITION;
			};
			
			vertexOutput vert(vertexInput v)
			{
				vertexOutput o;
				o.pos = UnityObjectToClipPos(v.vertex);
				return o;
			}

			half4 frag(vertexOutput i):COLOR
			{
				return _Color;
			}

			ENDCG	//To tell that the CG(Control over graphics)language ends here.
		}
	}








}
