shader_type canvas_item;

uniform vec4 base_color : source_color = vec4(0.0, 1.0, 1.0, 1.0); // Cyan color
uniform float glow_intensity : hint_range(0.0, 3.0) = 1.5;
uniform float outline_thickness : hint_range(0.0, 10.0) = 3.0;

void fragment() {
    // Base shape color
    vec4 original_color = base_color;
    
    // Create glow effect
    vec4 glow_color = base_color * glow_intensity;
    
    // Calculate distance from edge
    vec2 uv = UV * 2.0 - 1.0;
    float distance_from_center = length(uv);
    
    // Create soft edge glow
    float glow = smoothstep(1.0, 0.0, distance_from_center) * glow_intensity;
    
    // Add outer glow
    float outer_glow = smoothstep(1.0 + outline_thickness * 0.1, 0.8, distance_from_center);
    glow += outer_glow * glow_intensity * 0.5;
    
    // Combine colors
    COLOR = mix(vec4(0.0), glow_color, glow);
    
    // Add original shape
    if (distance_from_center < 1.0) {
        COLOR = mix(COLOR, original_color, 0.7);
    }
}