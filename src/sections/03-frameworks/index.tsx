// ═══════════════════════════════════════════════════════════════════
// Section 03 — ארבעה כלים (15 min)
// Overview of 4 classic metacognitive tools + the underlying loop.
// ═══════════════════════════════════════════════════════════════════
import React from 'react';
import SectionShell from '@/components/SectionShell/SectionShell';
import FourTools from './FourTools';
import MetacogLoop from './MetacogLoop';

const FrameworksSection: React.FC = () => (
  <SectionShell id="frameworks">
    <FourTools />
    <MetacogLoop />
  </SectionShell>
);

export default FrameworksSection;